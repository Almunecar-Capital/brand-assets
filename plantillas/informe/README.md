# Plantilla "Research Finanzas" v5 (estilo sobrio, sans, prosa)

Estilo derivado de la v2, que es la preferida del usuario: prosa narrativa, títulos limpios con filete fino y azul corporativo `#1F3A5F` discreto. Todo el texto va en Source Sans Pro (cifras tabulares en tablas) y las fórmulas en LaTeX con Latin Modern Math. Lleva cabecera y pie sutiles, tablas booktabs limpias y aviso legal breve al final. No tiene portada ni barra lateral.

**Uso:** `template/build.sh fuente.md salida.pdf` (pandoc 3 + XeLaTeX). El fuente de ejemplo es `ejemplo_fuente.md`.

**YAML:**
- `title`: título del bloque inicial.
- `short`: título corto para la cabecera (opcional).
- `date`: fecha.
- `meta`: línea de destinatario y corte.
- `subtitle`: opcional.

**Markdown:**
- **Ecuaciones:** `$...$` en línea y `$$ ... \tag{n} $$` centradas y numeradas. Decimales `{,}` y `\%` sin `\,` delante.
- **Notas:** una cita `>` o `::: notice` crea una nota discreta con filete azul.
- **Encabezados:** `##`, `###` y `####` (este último como título de apartado en bloque).
- **Tablas:** pipe tables con alineación (`---:` a la derecha para números) y nota en cursiva debajo.
- **Figuras:** `![Pie. *Fuente: ...*](img/x.pdf){width=100%}`, generadas en vectorial con `chartstyle.py` (`apply()`, `save(fig, 'img/x.pdf')`).
- **URLs:** como `<https://...>`.

**Copias de seguridad:** la plantilla anterior (v4, corporativa con portada y KPI) está en `v4_backup/` y la v3 en `v3_backup/`.

## Formato de las tesis de inversión (sección D)

Cada oportunidad es un `###` con estos subapartados `####`, en este orden y en prosa breve (extensión similar a la v2):

1. **Tesis:** 2–3 frases.
2. **Justificación:** uno o dos párrafos con las cifras clave verificadas y su fuente ([V]/[E]/[I]); si aporta, una tabla pequeña de escenarios con el cálculo esencial.
3. **Argumentos en contra.**
4. **Qué la invalidaría:** señales medibles.
5. **Nivel de evidencia:** una línea, con lo que falta.

## v7 — Almuñécar Capital
- Logo TikZ: `logo/aclogo.tex` (`\acsymbol[escala]`, `\acword{pt}`); exportado en `logo/logo.pdf`, `logo.svg`, `preview.png`.
- Cabecera: logo izq. + `short | date`; pie: "Almuñécar Capital — Uso interno / No constituye asesoramiento" + pág.
- Variable YAML opcional `series:` (texto a la derecha del bloque de título de pág. 1).
- Tablas factsheet automáticas (filters.lua): ancho completo, cabecera versalitas color corp, columnas numéricas alineadas a la derecha. Poner nota de fuente en cursiva debajo.
- build.sh pasa `-V templatedir`. Backup previo en `v6_backup/`.

## v8: modos diario/completo, one-pager, seguimiento de tesis (vigente)
Backup de v7 en `v7_backup/`. Ejemplo funcional: `template/ejemplo_diario.md`, que genera `../ejemplo_diario.pdf` (3 págs.).

### Modos (YAML `modo:`)
| Modo | Cuándo usarlo | Estructura | Extensión |
|---|---|---|---|
| `diario` | Días laborables sin evento material | Página 1 one-pager · Seguimiento de tesis · 3–5 posts de X · Riesgos y calendario · Fuentes | 3–4 págs. |
| `completo` (por defecto) | Domingos, o cualquier día con alerta material (ver `../PROCEDIMIENTO.md`) | Página 1 one-pager + índice; después, como anexo, las secciones A–G de v7 (contexto, X ×10, oportunidades D, riesgos, educativa, fuentes, glosario) | 10–15 págs. |

En `diario`, el título es más compacto y no lleva índice. En `completo`, el índice aparece tras el one-pager.

### Bloques (fenced divs)
- `::: onepager` … `:::`: página 1 en letra compacta, cerrada con salto de página. Contiene:
  - `#### Cinco novedades`: cinco párrafos en prosa breve, con la idea en negrita y cada cifra con su marca.
  - `#### Indicadores clave`: tabla `Indicador | Valor | Var. vs briefing anterior | Fuente y fecha`, cuyos valores salen de `fetch_indicadores.py`.
  - Debe caber en una página. Si se desborda, recorta prosa, no indicadores.
- `::: fuente` … `:::`: nota pequeña en cursiva gris bajo cada tabla o gráfico. Es obligatoria y lleva fuente y fecha corta.
- `::: {.anexo titulo="Anexo: análisis completo"}` … `:::`: título de anexo. Solo en modo completo, antes de la sección A.
- `::: notice`: nota entre filetes finos.

### Tabla "Seguimiento de tesis" (ambos modos)
`Tesis | Estado | Qué cambió desde el último briefing`, con una fila por tesis de `../registro_oportunidades.md`.
- Estados posibles: **Nueva / Se refuerza / Se debilita / Descartada**.
- Si una tesis no cambia, escribe "Sin cambios" y no repitas la justificación.
- Al cambiar un estado, actualiza también el registro.

### Indicadores: `fetch_indicadores.py`
`python3 template/fetch_indicadores.py [--no-guardar]` descarga de fuentes primarias:
- FRED: DGS2, DGS10, DFII10, T10YIE, DFEDTARU/L, BAMLH0A0HYM2, DCOILBRENTEU;
- BLS API: CUUR0000SA0, con la tasa anual calculada;
- BCE: FM DFR;
- Eurostat: prc_hicp_minr, zona euro y España (flash).

Funcionamiento:
- Compara con `../estado/indicadores_ultimo.json` e imprime una tabla Markdown con la variación, en puntos básicos para tipos.
- Después guarda el nuevo `indicadores_ultimo.json` y deja copia en `indicadores_previo.json` y `indicadores_AAAA-MM-DD.json`.
- Una fuente caída queda como `"fuente":"ERROR"`. No se rellena a mano: se indica "no disponible" en el informe.
- Usa el User-Agent `curl/...`, porque con un UA de navegador FRED deja la conexión colgada.
- FRED publica los bonos con un día de retraso. Si hay dato más fresco en la curva diaria del Tesoro, cítalo en la nota de fuente.
- Estado base: valores del 15-oct-2026, ya guardados.

### Regla de cifras de mercado
Toda cifra de mercado lleva fuente y fecha corta (`FRED DGS10, 13-oct`) en la tabla o en su nota `fuente`. En la prosa basta la marca [V]/[X]/[E]/[I] si la tabla ya da fuente y fecha.

### Conectores (probados el 15-oct-2026)
- **Aleph (`user-Aleph`): NO funciona.** `GetDynamicTools` devuelve `namespaceStatus: "error"` ("failed during live tool discovery") y la lista de herramientas está vacía, así que no se pudo consultar ASML. Cómo usarlo cuando esté reparado:
  1. Llama a `GetDynamicTools {namespace:"user-Aleph"}` y comprueba que el estado sea `ready`.
  2. Revisa el esquema y llama a `CallDynamicTool` con la consulta (cotización y múltiplos de ASML).
  3. Para valoraciones (precio, PER, EV/EBITDA, consenso), **prefiere Aleph sobre Yahoo**. Yahoo (API de gráficos no oficial) queda solo como respaldo, marcado [E].
- **Exa (`user-Exa`): conectado (`ready`), pero limitado.** Herramientas `web_search_exa` (`query`, `objective`, `numResults`) y `web_fetch_exa` (`urls`).
  - El 15-oct, todas las llamadas devolvieron HTTP 429: el límite gratuito del MCP de Exa estaba agotado ("create your own Exa API key").
  - Se puede usar para encontrar papers y notas de bancos centrales (BCE, Fed, BIS): describe la página ideal en `query` y fija los dominios en `objective`.
  - Lo que se encuentre con Exa se verifica en la fuente original antes de citarlo.
  - Ante un 429, espera unos 5 min o sigue con `WebSearch`/`WebFetch`. Con uso diario conviene una API key propia.

## Cambios v8 (18-oct-2026)

- `report.tex`: `\newcounter{none}` tras cargar paquetes (pandoc ≥ 3.5 emite `\def\LTcaptype{none}` en tablas sin pie; sin él falla con "No counter 'none' defined").
- `report.tex`: en modo completo el índice ("Contenido", `tocdepth` 2) se imprime justo después del one-pager mediante `\acindice` al cerrar el entorno `onepager`, en lugar de en una página en blanco antes de él.
- Se reinstaló TeX Live (xetex, latex-extra, fonts-recommended, lang-spanish, science, pictures, lmodern) y poppler-utils: faltaba `xelatex`, causa probable de los fallos del 16-oct.
- Copia de los ficheros anteriores en `template/v8_backup/`.
