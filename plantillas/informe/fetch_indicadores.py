#!/usr/bin/env python3
"""Descarga indicadores clave de fuentes primarias y los compara con el briefing anterior.
Uso: fetch_indicadores.py [--estado DIR] [--no-guardar]
Escribe estado/indicadores_ultimo.json (y copia histórica estado/indicadores_AAAA-MM-DD.json),
renombrando el anterior a indicadores_previo.json. Imprime tabla Markdown con variaciones."""
import csv, io, json, sys, os, datetime, urllib.request, argparse, shutil
UA={'User-Agent':'curl/8.5.0'}  # con UA de navegador FRED se cuelga
def get(url, data=None, headers=None):
    h=dict(UA); h.update(headers or {})
    req=urllib.request.Request(url, data=data, headers=h)
    with urllib.request.urlopen(req, timeout=25) as r: return r.read().decode()

FRED={'DGS2':('Bono EE.UU. 2 años','%'),'DGS10':('Bono EE.UU. 10 años','%'),
 'DFII10':('TIPS 10 años (tipo real)','%'),'T10YIE':('Inflación implícita 10 años','%'),
 'DFEDTARU':('Fed funds, techo','%'),'DFEDTARL':('Fed funds, suelo','%'),
 'BAMLH0A0HYM2':('Diferencial high yield (ICE BofA)','pp'),'DCOILBRENTEU':('Brent','USD/barril')}
def fred(s):
    t=get(f'https://fred.stlouisfed.org/graph/fredgraph.csv?id={s}')
    rows=[r for r in csv.reader(io.StringIO(t))][1:]
    rows=[r for r in rows if r[1] not in ('.','')]
    d,v=rows[-1]; return float(v), d, f'FRED {s}'
def bls():
    j=json.loads(get('https://api.bls.gov/publicAPI/v2/timeseries/data/',
        json.dumps({'seriesid':['CUUR0000SA0'],'startyear':str(datetime.date.today().year-1),
                    'endyear':str(datetime.date.today().year)}).encode(),{'Content-Type':'application/json'}))
    d=j['Results']['series'][0]['data']; cur=d[0]
    prev=[x for x in d if x['year']==str(int(cur['year'])-1) and x['period']==cur['period']][0]
    yoy=round((float(cur['value'])/float(prev['value'])-1)*100,2)
    return yoy, f"{cur['year']}-{cur['period'][1:]}", 'BLS API CUUR0000SA0 (IPC NSA, var. anual calculada)'
def ecb_dfr():
    t=get('https://data-api.ecb.europa.eu/service/data/FM/D.U2.EUR.4F.KR.DFR.LEV?lastNObservations=1&format=csvdata')
    r=list(csv.DictReader(io.StringIO(t)))[-1]
    return float(r['OBS_VALUE']), r['TIME_PERIOD'], 'BCE Data Portal FM DFR'
def eurostat(geo):
    j=json.loads(get(f'https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/prc_hicp_minr?geo={geo}&coicop18=TOTAL&unit=RCH_A&lastTimePeriod=1'))
    if 'coicop18' not in j.get('id',[]) and not j.get('value'):
        j=json.loads(get(f'https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/prc_hicp_minr?geo={geo}&coicop=CP00&unit=RCH_A&lastTimePeriod=1'))
    t=list(j['dimension']['time']['category']['index'])[-1]
    return float(list(j['value'].values())[-1]), t, f'Eurostat prc_hicp_minr {geo} (flash)'
FUENTES=[(k,n,u,(lambda s=k: fred(s))) for k,(n,u) in FRED.items()]+[
 ('US_CPI_YOY','IPC EE.UU., anual','%',bls),('ECB_DFR','BCE, tipo de depósito','%',ecb_dfr),
 ('EA_HICP','IAPC zona euro (flash), anual','%',lambda: eurostat('EA')),
 ('ES_HICP','IAPC España (flash), anual','%',lambda: eurostat('ES'))]
def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--estado',default=os.path.join(os.path.dirname(__file__),'..','estado'))
    ap.add_argument('--no-guardar',action='store_true'); a=ap.parse_args()
    est=os.path.abspath(a.estado); os.makedirs(est,exist_ok=True)
    ult=os.path.join(est,'indicadores_ultimo.json')
    prev=json.load(open(ult))['indicadores'] if os.path.exists(ult) else {}
    out={}
    for k,n,u,f in FUENTES:
        try: v,d,s=f(); out[k]={'nombre':n,'valor':v,'unidad':u,'fecha':d,'fuente':s}
        except Exception as e: out[k]={'nombre':n,'valor':None,'unidad':u,'fecha':None,'fuente':'ERROR','error':str(e)[:200]}
        p=prev.get(k,{}).get('valor'); c=out[k]['valor']
        out[k]['var_vs_anterior']=None if p is None or c is None else round(c-p,3)
        out[k]['anterior']={'valor':p,'fecha':prev.get(k,{}).get('fecha')} if p is not None else None
    doc={'generado':datetime.datetime.now().astimezone().isoformat(timespec='minutes'),'indicadores':out}
    print('| Indicador | Valor | Var. vs anterior | Fuente y fecha |\n|---|---|---|---|')
    for k,r in out.items():
        var='—' if r['var_vs_anterior'] is None else (f"{r['var_vs_anterior']*100:+.0f} pb" if r['unidad'] in('%','pp') else f"{r['var_vs_anterior']:+.2f}")
        print(f"| {r['nombre']} | {r['valor']} {r['unidad']} | {var} | {r['fuente']}, {r['fecha']} |")
    if not a.no_guardar:
        if os.path.exists(ult): shutil.copy(ult, os.path.join(est,'indicadores_previo.json'))
        json.dump(doc,open(ult,'w'),ensure_ascii=False,indent=1)
        json.dump(doc,open(os.path.join(est,f"indicadores_{datetime.date.today()}.json"),'w'),ensure_ascii=False,indent=1)
if __name__=='__main__': main()
