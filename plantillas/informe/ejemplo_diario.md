---
title: "Briefing diario: 15 de octubre de 2026"
short: "Macro & Markets Briefing"
series: "Macro \\& Markets Briefing · Diario"
date: "15 octubre 2026"
meta: "Para: Juan · Corte: jueves 15 oct. 2026, 12:30 (Madrid) · Modo diario · Análisis de research, no asesoramiento"
modo: diario
lang: es
---

::: onepager
#### Cinco novedades

**1. La inflación de EE.UU. se acelera y se generaliza.** El IPC (índice de precios al consumo) subió un 0,6 % en septiembre y la tasa anual llega al 3,74 % [V, BLS]. Lo relevante es la amplitud: suben a la vez bienes, vivienda y servicios, y la subyacente a tres meses anualizada ronda el 3,4 % [X, verificado con tres fuentes].

**2. La Reserva Federal (Fed) puede volver a subir el 27–28 de octubre.** Su tipo está en el 3,75–4,00 % [V]. El mercado llegó a asignar un 30–50 % a otra subida y luego lo moderó [X/E, sin verificar].

**3. Los tipos largos están en máximos de dos décadas, y casi todo es tipo real.** El bono a 10 años rinde un 5,21 %: un 2,88 % real (TIPS, bonos ligados a la inflación) y un 2,35 % de inflación implícita [V, FRED].

**4. Europa sufre el mismo shock energético.** El IAPC (índice armonizado) adelantado de septiembre sube al 3,8 % en la zona euro y al 5,0 % en España, con el Brent en 125 dólares; el BCE tiene el tipo de depósito en el 2,50 % [V].

**5. Récord en resultados de IA, caídas en bolsa.** ASML y TSMC confirman una demanda de chips muy fuerte [V], pero los semiconductores encadenan sesiones a la baja por los tipos reales altos y las dudas sobre la financiación con deuda [X].

#### Indicadores clave

| Indicador | Valor | Var. vs briefing anterior | Fuente y fecha |
|---|---|---|---|
| Bono EE.UU. 2 años | 4,79 % | — | FRED DGS2, 13-oct |
| Bono EE.UU. 10 años | 5,21 % | — | FRED DGS10, 13-oct |
| Tipo real 10 años (TIPS) | 2,88 % | — | FRED DFII10, 13-oct |
| Inflación implícita 10 años | 2,35 % | — | FRED T10YIE, 14-oct |
| Fed funds (rango objetivo) | 3,75–4,00 % | — | FRED DFEDTARL/U, 14-oct |
| Diferencial *high yield* | 3,16 pp | — | FRED BAMLH0A0HYM2, 13-oct |
| Brent | 125,44 \$/barril | — | FRED DCOILBRENTEU, 06-oct |
| IPC EE.UU., anual | 3,74 % | — | BLS CUUR0000SA0, sep-26 |
| BCE, tipo de depósito | 2,50 % | — | BCE FM DFR, 15-oct |
| IAPC zona euro / España (flash) | 3,8 % / 5,0 % | — | Eurostat prc_hicp_minr, sep-26 |

::: fuente
Primer briefing con este formato: no hay valores previos con los que comparar. Las variaciones se calculan con `template/fetch_indicadores.py` frente a `estado/indicadores_ultimo.json`. pb = puntos básicos (0,01 %). El 2 años del Tesoro (curva diaria, 14-oct) es 4,82 %; FRED publica con un día de retraso.
:::
:::

## Seguimiento de tesis

Las tres tesis del registro se dieron de alta hoy, así que todas figuran como nuevas. A partir del próximo briefing, esta tabla indicará solo lo que haya cambiado.

| Tesis | Estado | Qué cambió desde el último briefing |
|---|---|---|
| D1 · ASML: cuello de botella EUV de la IA | Nueva | Alta. Resultados del 3T26 sólidos, pero el precio ya los descuenta (PER de los últimos 12 meses ~41x) [V/E] |
| D2 · TIPS a 10 años con tipo real del 2,88 % | Nueva | Alta. Tipo real en máximos desde 2008 [V] |
| D3 · Bono del Tesoro a 2 años (4,8 %) | Nueva | Alta. Descuenta 3–4 subidas; depende del FOMC del 28-oct [V/I] |

::: fuente
Detalle completo de cada tesis en `registro_oportunidades.md`. Estados posibles: Nueva / Se refuerza / Se debilita / Descartada.
:::

## Publicaciones de X destacadas

**Nick Timiraos (@NickTimiraos), The Wall Street Journal.** 14 oct., 15:36. <https://x.com/NickTimiraos/status/2110364192125428189>. La sorpresa de septiembre está repartida entre bienes subyacentes (+0,25 %), vivienda (+0,39 %) y servicios sin vivienda (+0,42 %). Esta amplitud es lo que más preocupa a un banco central. Fuente muy fiable; no pude cargar las tablas del BLS para contrastar el desglose.

**Mohamed A. El-Erian (@elerianm), Allianz.** 14 oct., 20:24. <https://x.com/elerianm/status/2110436689462325421>. Los rendimientos y la probabilidad de subida saltaron tras el dato, pero se moderaron durante la sesión. El Tesoro confirma un 10 años al 5,19 % al cierre [V]; la causa de la reversión es interpretación [I].

**Conor Sen (@conorsen), Bloomberg Opinion.** 15 oct., 11:43. <https://x.com/conorsen/status/2110667891473371581>. Sostiene que los rendimientos serían bastante más bajos sin el auge de inversión en IA, porque esta eleva el tipo de interés natural. Es una opinión razonada, no un hecho demostrable.

**KaizenInvestor (@Kaizen_Investor).** 15 oct., 09:52. <https://x.com/Kaizen_Investor/status/2110639858506993903>. Resultados de TSMC por encima de lo previsto y margen bruto del 66,4 % [V]. Matiz omitido: el crecimiento del 52 % es en dólares taiwaneses; en dólares estadounidenses es del 41,2 % [V].

## Riesgos y calendario

| Fecha (Madrid) | Evento | Por qué importa |
|---|---|---|
| Madrugada del 16-oct | Warsh con Georgieva (FMI), Bangkok | Última señal antes del periodo de silencio |
| 27–28 oct | FOMC | ¿Nueva subida? Clave para D2 y D3 |
| Finales de oct | Resultados de grandes tecnológicas | Inversión en IA; clave para D1 |
| ~30 oct (por confirmar) | IAPC flash de octubre | ¿Efectos de segunda ronda en Europa? |

El riesgo principal es que el shock energético (Brent por encima de 130 \$) contagie más a la subyacente. Eso empujaría a los bancos centrales a endurecer en exceso y castigaría a los emisores más endeudados de la infraestructura de IA, con un diferencial de crédito que deja poco colchón [I].

## Fuentes

FRED (<https://fred.stlouisfed.org>), series DGS2, DGS10, DFII10, T10YIE, DFEDTARL/U, BAMLH0A0HYM2 y DCOILBRENTEU · BLS API, serie CUUR0000SA0 · Portal de datos del BCE, serie FM DFR · Eurostat, prc_hicp_minr · SEC EDGAR, ASML 6-K del 3T26 · API pública de X (namespace `x`). Marcas: [V] verificado, [X] publicado en X, [E] estimación o fuente no oficial, [I] interpretación propia.
