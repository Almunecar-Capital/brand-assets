"""Estilo de gráficos Research Finanzas v5 (PDF vectorial, Source Sans Pro, paleta sobria).
Uso: from chartstyle import apply, save, PALETTE"""
import glob, matplotlib; matplotlib.use('Agg'); import matplotlib.pyplot as plt
from matplotlib import font_manager as fm
for f in glob.glob('/usr/share/fonts/truetype/sand-box/custom/Source Sans Pro/*.ttf'): fm.fontManager.addfont(f)
PALETTE=['#1F3A5F','#5B7FA6','#9AA5B1','#B07D3A','#3E6B5A','#7A3E3E']
def apply():
    plt.rcParams.update({'font.family':'Source Sans Pro','font.size':9,'axes.edgecolor':'#9AA5B1','axes.labelcolor':'#222A33',
     'axes.spines.top':False,'axes.spines.right':False,'axes.grid':True,'axes.grid.axis':'y','grid.color':'#E3E7EC','grid.linewidth':.6,
     'axes.prop_cycle':matplotlib.cycler(color=PALETTE),'legend.frameon':False,'xtick.color':'#6B7280','ytick.color':'#6B7280','pdf.fonttype':42})
def save(fig,path): fig.tight_layout(); fig.savefig(path)
