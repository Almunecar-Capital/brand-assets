// =====================================================================
//  ALMUÑÉCAR CAPITAL · INSTITUTIONAL ONE-PAGER
//  Executive Macro Briefing · estilo Wall Street Research
//
//  Compilar:  typst compile --font-path fonts --ignore-system-fonts one_pager.typ
//  Autocontenida: datos y logo dentro del archivo. Solo requiere fuente Source Sans Pro.
//
//  Tipografía idéntica a template/report.tex:
//    · Source Sans Pro Regular (texto), Semibold (= \bfseries), Light (subtítulo)
//    · Sin Bold (700) en ningún elemento
//    · Cifras de tabla tabulares y de caja alta (Numbers={Tabular,Lining})
// =====================================================================

// ---------- 1. Paleta (report.tex) ----------
// ===== DATOS EDITABLES (sin archivos externos) =====
// GRÁFICO DE LÍNEA GENÉRICO (columna derecha). Sirve para cualquier serie diaria:
// cambia título, fuente y datos ("AAAA-MM-DD", valor). Los datos de abajo son solo EJEMPLO.
#let grafico-titulo = "UST 10 años · últimos 3 meses (%)"
#let grafico-fuente = "Fuente: Tesoro EE.UU. vía FRED (DGS10), cierre diario."
#let grafico-unidad = "%"
#let grafico-datos = (
  ("2026-08-03", 4.70),
  ("2026-08-04", 4.63),
  ("2026-08-05", 4.63),
  ("2026-08-06", 4.69),
  ("2026-08-07", 4.65),
  ("2026-08-10", 4.72),
  ("2026-08-11", 4.70),
  ("2026-08-12", 4.68),
  ("2026-08-13", 4.63),
  ("2026-08-14", 4.68),
  ("2026-08-17", 4.72),
  ("2026-08-18", 4.71),
  ("2026-08-19", 4.65),
  ("2026-08-20", 4.69),
  ("2026-08-21", 4.74),
  ("2026-08-24", 4.70),
  ("2026-08-25", 4.64),
  ("2026-08-26", 4.66),
  ("2026-08-27", 4.67),
  ("2026-08-28", 4.73),
  ("2026-08-31", 4.75),
  ("2026-09-01", 4.79),
  ("2026-09-02", 4.79),
  ("2026-09-03", 4.77),
  ("2026-09-04", 4.78),
  ("2026-09-08", 4.80),
  ("2026-09-09", 4.83),
  ("2026-09-10", 4.95),
  ("2026-09-11", 4.96),
  ("2026-09-14", 4.97),
  ("2026-09-15", 5.00),
  ("2026-09-16", 5.01),
  ("2026-09-17", 4.94),
  ("2026-09-18", 5.01),
  ("2026-09-21", 4.96),
  ("2026-09-22", 4.96),
  ("2026-09-23", 5.11),
  ("2026-09-24", 5.18),
  ("2026-09-25", 5.17),
  ("2026-09-28", 5.24),
  ("2026-09-29", 5.26),
  ("2026-09-30", 5.29),
  ("2026-10-01", 5.24),
  ("2026-10-02", 5.28),
  ("2026-10-05", 5.31),
  ("2026-10-06", 5.27),
  ("2026-10-07", 5.28),
  ("2026-10-08", 5.22),
  ("2026-10-09", 5.24),
  ("2026-10-13", 5.21),
  ("2026-10-14", 5.19),
  ("2026-10-15", 5.10),
  ("2026-10-16", 5.09),
  ("2026-10-19", 5.15),
  ("2026-10-20", 5.12),
  ("2026-10-21", 5.13),
  ("2026-10-22", 4.96),
  ("2026-10-23", 5.00),
  ("2026-10-26", 5.00),
  ("2026-10-27", 4.99),
  ("2026-10-28", 5.05),
  ("2026-10-29", 4.98),
  ("2026-10-30", 4.94),
  ("2026-11-02", 4.91),
  ("2026-11-03", 4.95),
)
// Logo incrustado
#let logo-svg = bytes("<?xml version=\"1.0\" encoding=\"UTF-8\"?> <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"293.08\" height=\"70.65\" viewBox=\"0 0 293.08 70.65\"> <defs> <g> <g id=\"glyph-0-0\"> <path d=\"M 3.671875 -5.828125 L 3.296875 -4.515625 L 6.0625 -4.515625 L 5.703125 -5.828125 C 5.515625 -6.410156 5.335938 -7.007812 5.171875 -7.625 C 5.015625 -8.25 4.859375 -8.859375 4.703125 -9.453125 L 4.640625 -9.453125 C 4.492188 -8.847656 4.335938 -8.238281 4.171875 -7.625 C 4.015625 -7.007812 3.847656 -6.410156 3.671875 -5.828125 Z M -0.03125 0 L 3.546875 -11.03125 L 5.90625 -11.03125 L 9.46875 0 L 7.34375 0 L 6.5 -2.953125 L 2.84375 -2.953125 L 2 0 Z M -0.03125 0 \"/> </g> <g id=\"glyph-0-1\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 3.40625 -11.03125 L 3.40625 -1.6875 L 7.953125 -1.6875 L 7.953125 0 Z M 1.40625 0 \"/> </g> <g id=\"glyph-0-2\"> <path d=\"M 1.375 0 L 1.375 -11.03125 L 3.75 -11.03125 L 5.625 -5.625 C 5.75 -5.28125 5.863281 -4.9375 5.96875 -4.59375 C 6.070312 -4.25 6.171875 -3.875 6.265625 -3.46875 L 6.34375 -3.46875 C 6.4375 -3.875 6.53125 -4.25 6.625 -4.59375 C 6.726562 -4.9375 6.835938 -5.28125 6.953125 -5.625 L 8.828125 -11.03125 L 11.1875 -11.03125 L 11.1875 0 L 9.34375 0 L 9.34375 -5.03125 C 9.34375 -5.375 9.359375 -5.757812 9.390625 -6.1875 C 9.421875 -6.613281 9.457031 -7.035156 9.5 -7.453125 C 9.550781 -7.878906 9.597656 -8.257812 9.640625 -8.59375 L 9.578125 -8.59375 L 8.703125 -5.9375 L 6.90625 -1.015625 L 5.59375 -1.015625 L 3.84375 -5.9375 L 2.96875 -8.59375 L 2.90625 -8.59375 C 2.945312 -8.257812 2.988281 -7.878906 3.03125 -7.453125 C 3.082031 -7.035156 3.125 -6.613281 3.15625 -6.1875 C 3.1875 -5.757812 3.203125 -5.375 3.203125 -5.03125 L 3.203125 0 Z M 1.375 0 \"/> </g> <g id=\"glyph-0-3\"> <path d=\"M 5.546875 0.203125 C 4.691406 0.203125 3.945312 0.0351562 3.3125 -0.296875 C 2.675781 -0.640625 2.1875 -1.179688 1.84375 -1.921875 C 1.5 -2.671875 1.328125 -3.648438 1.328125 -4.859375 L 1.328125 -11.03125 L 3.34375 -11.03125 L 3.34375 -4.703125 C 3.34375 -3.515625 3.539062 -2.6875 3.9375 -2.21875 C 4.34375 -1.757812 4.878906 -1.53125 5.546875 -1.53125 C 5.992188 -1.53125 6.382812 -1.628906 6.71875 -1.828125 C 7.050781 -2.023438 7.3125 -2.359375 7.5 -2.828125 C 7.6875 -3.296875 7.78125 -3.921875 7.78125 -4.703125 L 7.78125 -11.03125 L 9.734375 -11.03125 L 9.734375 -4.859375 C 9.734375 -3.648438 9.5625 -2.671875 9.21875 -1.921875 C 8.882812 -1.179688 8.40625 -0.640625 7.78125 -0.296875 C 7.15625 0.0351562 6.410156 0.203125 5.546875 0.203125 Z M 5.546875 0.203125 \"/> </g> <g id=\"glyph-0-4\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 3.546875 -11.03125 L 6.84375 -4.953125 C 7.039062 -4.585938 7.234375 -4.191406 7.421875 -3.765625 C 7.609375 -3.335938 7.789062 -2.90625 7.96875 -2.46875 L 8.046875 -2.46875 C 7.984375 -3.0625 7.921875 -3.679688 7.859375 -4.328125 C 7.804688 -4.972656 7.78125 -5.597656 7.78125 -6.203125 L 7.78125 -11.03125 L 9.65625 -11.03125 L 9.65625 0 L 7.515625 0 L 4.21875 -6.0625 C 4.007812 -6.4375 3.8125 -6.835938 3.625 -7.265625 C 3.445312 -7.691406 3.265625 -8.125 3.078125 -8.5625 L 3.015625 -8.5625 C 3.078125 -7.988281 3.132812 -7.375 3.1875 -6.71875 C 3.238281 -6.070312 3.265625 -5.441406 3.265625 -4.828125 L 3.265625 0 Z M 6.90625 -11.796875 C 6.601562 -11.796875 6.332031 -11.847656 6.09375 -11.953125 C 5.863281 -12.066406 5.660156 -12.191406 5.484375 -12.328125 C 5.304688 -12.472656 5.140625 -12.597656 4.984375 -12.703125 C 4.835938 -12.804688 4.679688 -12.859375 4.515625 -12.859375 C 4.328125 -12.859375 4.164062 -12.78125 4.03125 -12.625 C 3.90625 -12.476562 3.828125 -12.242188 3.796875 -11.921875 L 2.484375 -12 C 2.523438 -12.769531 2.722656 -13.34375 3.078125 -13.71875 C 3.429688 -14.09375 3.882812 -14.28125 4.4375 -14.28125 C 4.738281 -14.28125 5.003906 -14.222656 5.234375 -14.109375 C 5.472656 -14.003906 5.679688 -13.878906 5.859375 -13.734375 C 6.035156 -13.597656 6.195312 -13.476562 6.34375 -13.375 C 6.5 -13.269531 6.660156 -13.21875 6.828125 -13.21875 C 7.222656 -13.21875 7.460938 -13.53125 7.546875 -14.15625 L 8.859375 -14.0625 C 8.816406 -13.3125 8.617188 -12.742188 8.265625 -12.359375 C 7.910156 -11.984375 7.457031 -11.796875 6.90625 -11.796875 Z M 6.90625 -11.796875 \"/> </g> <g id=\"glyph-0-5\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 8.0625 -11.03125 L 8.0625 -9.34375 L 3.40625 -9.34375 L 3.40625 -6.578125 L 7.34375 -6.578125 L 7.34375 -4.890625 L 3.40625 -4.890625 L 3.40625 -1.6875 L 8.234375 -1.6875 L 8.234375 0 Z M 3.90625 -11.59375 L 3.171875 -12.578125 L 6.515625 -14.875 L 7.375 -13.578125 Z M 3.90625 -11.59375 \"/> </g> <g id=\"glyph-0-6\"> <path d=\"M 5.796875 0.203125 C 4.878906 0.203125 4.039062 -0.015625 3.28125 -0.453125 C 2.53125 -0.890625 1.929688 -1.53125 1.484375 -2.375 C 1.046875 -3.226562 0.828125 -4.265625 0.828125 -5.484375 C 0.828125 -6.679688 1.050781 -7.707031 1.5 -8.5625 C 1.957031 -9.425781 2.566406 -10.085938 3.328125 -10.546875 C 4.097656 -11.003906 4.953125 -11.234375 5.890625 -11.234375 C 6.578125 -11.234375 7.191406 -11.09375 7.734375 -10.8125 C 8.273438 -10.539062 8.71875 -10.210938 9.0625 -9.828125 L 8.015625 -8.59375 C 7.734375 -8.875 7.421875 -9.085938 7.078125 -9.234375 C 6.734375 -9.390625 6.347656 -9.46875 5.921875 -9.46875 C 5.335938 -9.46875 4.816406 -9.3125 4.359375 -9 C 3.898438 -8.6875 3.539062 -8.234375 3.28125 -7.640625 C 3.019531 -7.054688 2.890625 -6.351562 2.890625 -5.53125 C 2.890625 -4.289062 3.15625 -3.3125 3.6875 -2.59375 C 4.226562 -1.882812 4.960938 -1.53125 5.890625 -1.53125 C 6.367188 -1.53125 6.796875 -1.625 7.171875 -1.8125 C 7.554688 -2 7.898438 -2.257812 8.203125 -2.59375 L 9.296875 -1.40625 C 8.359375 -0.332031 7.191406 0.203125 5.796875 0.203125 Z M 5.796875 0.203125 \"/> </g> <g id=\"glyph-0-7\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 5.125 -11.03125 C 5.894531 -11.03125 6.585938 -10.925781 7.203125 -10.71875 C 7.816406 -10.519531 8.300781 -10.179688 8.65625 -9.703125 C 9.019531 -9.222656 9.203125 -8.566406 9.203125 -7.734375 C 9.203125 -6.898438 9.003906 -6.222656 8.609375 -5.703125 C 8.222656 -5.179688 7.695312 -4.804688 7.03125 -4.578125 L 9.640625 0 L 7.40625 0 L 5.046875 -4.28125 L 3.40625 -4.28125 L 3.40625 0 Z M 3.40625 -5.890625 L 4.921875 -5.890625 C 5.671875 -5.890625 6.242188 -6.039062 6.640625 -6.34375 C 7.035156 -6.65625 7.234375 -7.117188 7.234375 -7.734375 C 7.234375 -8.367188 7.035156 -8.804688 6.640625 -9.046875 C 6.242188 -9.296875 5.671875 -9.421875 4.921875 -9.421875 L 3.40625 -9.421875 Z M 3.40625 -5.890625 \"/> </g> <g id=\"glyph-0-8\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 4.890625 -11.03125 C 5.710938 -11.03125 6.441406 -10.921875 7.078125 -10.703125 C 7.722656 -10.492188 8.234375 -10.140625 8.609375 -9.640625 C 8.984375 -9.140625 9.171875 -8.460938 9.171875 -7.609375 C 9.171875 -6.785156 8.984375 -6.109375 8.609375 -5.578125 C 8.242188 -5.046875 7.742188 -4.65625 7.109375 -4.40625 C 6.472656 -4.15625 5.753906 -4.03125 4.953125 -4.03125 L 3.40625 -4.03125 L 3.40625 0 Z M 3.40625 -5.625 L 4.8125 -5.625 C 6.394531 -5.625 7.1875 -6.285156 7.1875 -7.609375 C 7.1875 -8.273438 6.976562 -8.742188 6.5625 -9.015625 C 6.144531 -9.285156 5.535156 -9.421875 4.734375 -9.421875 L 3.40625 -9.421875 Z M 3.40625 -5.625 \"/> </g> <g id=\"glyph-0-9\"> <path d=\"M 1.40625 0 L 1.40625 -11.03125 L 3.40625 -11.03125 L 3.40625 0 Z M 1.40625 0 \"/> </g> <g id=\"glyph-0-10\"> <path d=\"M 3.609375 0 L 3.609375 -9.34375 L 0.4375 -9.34375 L 0.4375 -11.03125 L 8.78125 -11.03125 L 8.78125 -9.34375 L 5.609375 -9.34375 L 5.609375 0 Z M 3.609375 0 \"/> </g> </g> </defs> <path fill=\"none\" stroke-width=\"2.41098\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke=\"rgb(12.199402%, 22.698975%, 37.298584%)\" stroke-opacity=\"1\" stroke-miterlimit=\"10\" d=\"M -0.00175009 38.665244 C -0.00175009 46.241655 6.141816 52.385221 13.718227 52.385221 C 21.298564 52.385221 27.438205 46.241655 27.438205 38.665244 \" transform=\"matrix(0.99507, 0, 0, -0.99507, 24.247835, 60.591828)\"/> <path fill=\"none\" stroke-width=\"1.9726\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke=\"rgb(12.199402%, 22.698975%, 37.298584%)\" stroke-opacity=\"1\" stroke-miterlimit=\"10\" d=\"M -15.590314 38.665244 L 43.030694 38.665244 \" transform=\"matrix(0.99507, 0, 0, -0.99507, 24.247835, 60.591828)\"/> <path fill=\"none\" stroke-width=\"2.41098\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke=\"rgb(12.199402%, 22.698975%, 37.298584%)\" stroke-opacity=\"1\" stroke-miterlimit=\"10\" d=\"M -15.590314 22.45251 C -3.118678 31.183047 3.119103 13.718046 13.718227 22.45251 C 24.321277 31.183047 30.559058 13.718046 43.030694 22.45251 \" transform=\"matrix(0.99507, 0, 0, -0.99507, 24.247835, 60.591828)\"/> <path fill=\"none\" stroke-width=\"2.41098\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke=\"rgb(51.699829%, 57.499695%, 65.499878%)\" stroke-opacity=\"1\" stroke-miterlimit=\"10\" d=\"M -15.590314 7.484191 C -3.118678 16.214729 3.119103 -1.246347 13.718227 7.484191 C 24.321277 16.214729 30.559058 -1.246347 43.030694 7.484191 \" transform=\"matrix(0.99507, 0, 0, -0.99507, 24.247835, 60.591828)\"/> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-0\" x=\"78.244337\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-1\" x=\"90.698711\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-2\" x=\"102.209317\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-3\" x=\"117.815205\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-4\" x=\"131.904321\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-5\" x=\"146.010291\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-6\" x=\"158.127605\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-0\" x=\"170.885334\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-7\" x=\"183.356561\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-6\" x=\"206.175537\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-0\" x=\"218.933266\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-8\" x=\"231.404493\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-9\" x=\"244.26334\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-10\" x=\"252.083137\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-0\" x=\"263.661155\" y=\"42.480551\"/> </g> <g fill=\"rgb(12.199402%, 22.698975%, 37.298584%)\" fill-opacity=\"1\"> <use xlink:href=\"#glyph-0-1\" x=\"276.132383\" y=\"42.480551\"/> </g> </svg> ")
#let corp   = rgb("#1F3A5F")   // azul corporativo
#let ink    = rgb("#222A33")
#let muted  = rgb("#6B7280")
#let rulec  = rgb("#CBD2DA")
#let wash   = rgb("#F3F5F8")
#let steel  = rgb("#9AA5B1")   // barras negativas / contornos
#let red    = rgb("#A11D21")   // único acento: estado del documento

// ---------- 2. Sistema de espaciado (múltiplos de 4 pt) ----------
#let sp = (xs: 2pt, s: 4pt, m: 8pt, l: 12pt, xl: 16pt)
#let gutter = 16pt             // separación entre columnas y entre tarjetas KPI
#let side   = 6.1cm            // ancho de la barra lateral

// ---------- 3. Pesos (Source Sans Pro) ----------
#let w-light = 300
#let w-reg   = 400
#let w-semi  = 600

// ---------- 4. Metadatos del número ----------
#let meta = (
  area:   "MACRO GLOBAL · ESTRATEGIA MULTIACTIVO",
  fecha:  "5 de noviembre de 2026",
  corte:  "Cierre 4-nov · Intradía 5-nov",
  equipo: "Rafa",
  estado: "BORRADOR INTERNO",
  numero: "Nº 001",
)

// ---------- 5. Documento ----------
#set document(title: "Almuñécar Capital — Executive Macro Briefing, 5-nov-2026", author: "Almuñécar Capital")
#set text(font: "Source Sans Pro", size: 8.4pt, weight: w-reg, fill: ink,
          lang: "es", region: "es", number-type: "lining")
#set par(justify: true, leading: 0.56em, spacing: 0.7em)
#set list(indent: 0pt, body-indent: 5pt, spacing: 0.5em, marker: text(fill: corp)[•])
#set strong(delta: 200)        // 400 → 600 (Semibold), como \textbf

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 1.5cm, x: 1.6cm),
  header-ascent: 0.5cm,
  footer-descent: 0.5cm,
  header: {
    grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
      stack(spacing: 6pt,
        image(logo-svg, format: "svg", height: 7.8mm),
        text(size: 7pt, fill: muted, tracking: 0.08em)[#meta.area]),
      {
        set text(size: 7.2pt, fill: muted)
        set par(leading: 0.5em)
        align(right)[
          *Fecha:* #meta.fecha \
          *Corte:* #meta.corte \
          *Equipo Macro:* #meta.equipo #h(3pt)|#h(3pt) #text(fill: red, weight: w-semi, tracking: 0.03em)[#meta.estado]
        ]
      })
    v(sp.m)
    line(length: 100%, stroke: 0.8pt + corp)
  },
  footer: {
    line(length: 100%, stroke: 0.4pt + rulec)
    v(sp.xs)
    set text(size: 6.6pt, fill: muted)
    grid(columns: (1fr, auto),
      [Almuñécar Capital — Uso interno · No constituye asesoramiento.],
      [Executive Macro Briefing #meta.numero #h(3pt)·#h(3pt) Página 1 de 1])
  },
)

// ---------- 6. Componentes ----------
// Nota de fuente (::: fuente de la plantilla)
#let fuente(body) = block(above: sp.s + 1pt, below: 0pt,
  text(size: 6.4pt, style: "italic", fill: muted)[#body])

// Título de sección con filete fino
#let seccion(t) = block(above: sp.l + 2pt, below: sp.m, sticky: true, width: 100%,
  stroke: (bottom: 0.5pt + rulec), inset: (bottom: sp.s),
  text(size: 9.6pt, weight: w-semi, fill: corp)[#t])

// Título de bloque en versalitas espaciadas (para tarjetas y cajas)
#let rotulo(t) = text(size: 6.6pt, weight: w-semi, fill: corp, tracking: 0.08em)[#upper(t)]

// Tarjeta lateral
#let tarjeta(t, body) = block(width: 100%, fill: wash, radius: 2pt,
  inset: (x: 9pt, top: 6pt, bottom: 6pt), below: 6pt)[
  #block(below: sp.s + 2pt, rotulo(t))
  #set text(size: 7.5pt)
  #set par(justify: false, leading: 0.5em, spacing: 0.6em)
  #body
]

// Caja destacada con barra lateral (claves, invalidación)
#let destacado(t, body) = block(width: 100%, fill: wash, stroke: (left: 2.5pt + corp),
  inset: (left: 11pt, right: 10pt, top: 8pt, bottom: 9pt))[
  #block(below: sp.s + 1pt, rotulo(t))
  #body
]

// Fuentes como hipervínculos discretos (sin bloque aparte)
#let src(name, url) = link(url)[#text(fill: corp, style: "normal")[#name]]
#let fuentes = [#src("CNBC", "https://www.cnbc.com") · #src("AP", "https://apnews.com") · #src("Reuters", "https://www.reuters.com") · #src("FXStreet", "https://www.fxstreet.com") · #src("XTB", "https://www.xtb.com") · #src("Trading Economics", "https://tradingeconomics.com") · #src("Bank of England", "https://www.bankofengland.co.uk")]

#let chg(s) = text(fill: ink, weight: w-semi)[#s]

// Etiqueta monocroma; "fuerte" = relleno corporativo
#let pill(s, fuerte: false) = box(inset: (x: 4pt, y: 1.8pt), radius: 6pt,
  fill: if fuerte { corp } else { none }, stroke: 0.5pt + if fuerte { corp } else { steel },
  text(size: 5.9pt, weight: w-semi, tracking: 0.04em, fill: if fuerte { white } else { corp },
       hyphenate: false)[#upper(s)])

// Tabla institucional: cabecera en versalitas, filetes finos, cifras tabulares
#let tabla(columns: auto, align: auto, size: 7.7pt, inset-y: 3.6pt, header, ..rows) = {
  let body = rows.pos()
  set text(size: size, number-width: "tabular")
  set par(justify: false, leading: 0.45em)
  table(
    columns: columns,
    inset: (x: 4pt, y: inset-y),
    align: if align == auto { left + horizon } else { (x, y) => align.at(x) + horizon },
    stroke: (x, y) => (
      top: if y == 0 { 0.9pt + corp } else { none },
      bottom: if y == 0 { 0.5pt + corp } else if y == body.len() { 0.6pt + corp } else { 0.3pt + rulec },
    ),
    table.header(..header.map(h => text(size: 6.3pt, weight: w-semi, fill: corp, tracking: 0.06em)[#upper(h)])),
    ..body.flatten(),
  )
}

// Celda de la franja de cifras clave
#let kpi(label, valor, var, nota) = block(width: 100%,
  fill: wash, stroke: (top: 2pt + corp), inset: (x: 8pt, top: 7pt, bottom: 6pt))[
  #text(size: 6.3pt, weight: w-semi, fill: muted, tracking: 0.08em)[#upper(label)]
  #v(sp.s - 1pt)
  #text(size: 14pt, weight: w-semi, fill: corp, number-width: "tabular")[#valor]#h(4pt)#text(size: 7.8pt, weight: w-semi)[#var]
  #v(sp.xs - 1pt)
  #text(size: 6.2pt, fill: muted)[#nota]
]

// Gráfico de barras nativo (variación diaria, %)
#let barras(data, maxv: 9.0, w: 1.15cm) = {
  set text(size: 7.2pt, number-width: "tabular")
  grid(
    columns: (1.95cm, w, w, 1fr),
    row-gutter: 3.5pt,
    align: (left + horizon, right + horizon, left + horizon, right + horizon),
    grid.vline(x: 2, stroke: 0.5pt + muted),
    ..data.map(((lab, v)) => {
      let len = calc.abs(v) / maxv * w
      let s = str(calc.round(calc.abs(v), digits: 2)).replace(".", ",")
      (
        lab,
        if v < 0 { rect(width: len, height: 6.5pt, fill: steel) } else { [] },
        if v > 0 { rect(width: len, height: 6.5pt, fill: corp) } else { [] },
        text(weight: w-semi)[#if v > 0 [+] else [−]#s %],
      )
    }).flatten(),
  )
}


// Gráfico de rangos por escenario frente al nivel actual
#let rango(titulo, lo, hi, spot, spot-txt, filas, ticks, fmt) = block(width: 100%, breakable: false,
  layout(size => {
    let lw = 1.9cm
    let w = size.width - lw
    let rh = 9.5pt
    let x(v) = (v - lo) / (hi - lo) * w
    let plot-h = rh * filas.len()
    set text(size: 6.6pt, number-width: "tabular")
    stack(spacing: sp.s,
      text(size: 6.3pt, weight: w-semi, fill: muted, tracking: 0.06em)[#upper(titulo)],
      box(width: 100%, height: plot-h + 17pt, {
        // rejilla y etiquetas de eje
        for t in ticks {
          place(top + left, dx: lw + x(t), dy: 8pt, line(angle: 90deg, length: plot-h, stroke: 0.3pt + rulec))
          place(top + left, dx: lw + x(t) - 14pt, dy: 8pt + plot-h + 2pt,
            box(width: 28pt, align(center, text(fill: muted)[#fmt(t)])))
        }
        // barras
        for (i, f) in filas.enumerate() {
          let (lab, a, b, col) = f
          place(top + left, dy: 8pt + i * rh, box(width: lw, height: rh, align(left + horizon, text(hyphenate: false, lab))))
          place(top + left, dx: lw + x(a), dy: 8pt + i * rh + 2.5pt,
            rect(width: x(b) - x(a), height: rh - 5pt, fill: col))
        }
        // nivel actual
        place(top + left, dx: lw + x(spot), dy: 8pt - 1pt,
          line(angle: 90deg, length: plot-h + 2pt, stroke: (paint: red, thickness: 0.8pt, dash: "dashed")))
        place(top + left, dx: lw + x(spot) - 30pt, dy: -1pt,
          box(width: 60pt, align(center, text(size: 6.2pt, weight: w-semi, fill: red)[#spot-txt])))
      }),
    )
  }))

// Punto numerado del análisis
#let punto(n, t, body) = block(above: 0pt, below: sp.m + 2pt, breakable: false,
  grid(columns: (18pt, 1fr), column-gutter: 2pt,
    text(size: 9.6pt, weight: w-semi, fill: corp)[#n],
    stack(spacing: sp.s + 1pt,
      text(size: 8.8pt, weight: w-semi, fill: corp)[#t],
      block(body))))

// =====================================================================
//  CONTENIDO
// =====================================================================

// ---------- Titular ----------
#block(above: 0pt, below: sp.l, stack(spacing: sp.m + 2pt,
  text(size: 16.5pt, weight: w-semi, fill: corp)[Se despeja el riesgo político; el petróleo sigue marcando el paso],
  text(size: 10pt, weight: w-light, fill: ink)[_Midterms_, Brent y primera subida del BoE desde 2023: qué cambia para tipos, divisas y renta variable.]))

// ---------- Franja de cifras clave ----------
#grid(columns: (1fr,) * 5, column-gutter: 8pt,
  kpi("Dow Jones", "53.356", "+3,03 %", "Mejor sesión desde abr-25"),
  kpi("S&P 500", "7.689", "+1,58 %", "Mejor sesión en 3 meses"),
  kpi("Brent", "94,62 $", "−8,7 %", "Mínimo de dos meses"),
  kpi("UST 10 años", "4,88 %", "−7 pb", "Curva −3 / −7 pb"),
  kpi("BoE Bank Rate", "4,00 %", "+25 pb", "1ª subida desde 2023"),
)
#fuente[Cierre del 4-nov-2026 (Bank Rate, 5-nov). Fuentes: #fuentes.]
#v(sp.l)

#grid(
  columns: (1fr, side),
  column-gutter: gutter,

  // =================== COLUMNA PRINCIPAL ===================
  [
    #destacado("Claves de la semana y tesis base")[
      La prima de riesgo político se comprime tras el control demócrata del Congreso, pero la energía sigue siendo el catalizador primario de inflación y tipos. El mercado ya no paga por la incertidumbre electoral; paga —y cobra— por cada titular sobre Ormuz. *Escenario base (55 %):* Brent entre 90 y 100 \$ y UST 10 años anclado en el 4,70–5,00 %.
    ]
    #v(sp.l)

    #punto("01", "Midterms: bloqueo legislativo y rotación sectorial")[
      Los demócratas se aseguran ambas cámaras (Senado 54–44, +7 netos) y Trump acepta el resultado, lo que elimina la cola de una impugnación. El bloqueo reduce la probabilidad de nuevo estímulo fiscal —positivo para la duración— a cambio de elevar el riesgo de choque por el techo de deuda en 2027. La rotación castigó al hardware de IA (SOX −3,8 %, Eaton −9,9 %) y premió a hiperescaladores (Microsoft +6,7 %) y consumo discrecional (+4,2 %).
    ]

    #punto("02", "Energía: la prima geopolítica cede, la oferta física no")[
      El Brent cayó un 8,7 % hasta 94,62 \$ después de que el vicepresidente Vance atribuyera la derrota a la guerra con Irán, tras un −6 % intradía el lunes por la mediación de Catar. No hay acuerdo firmado ni normalización del tránsito por Ormuz: lo que se ha comprimido es la prima de expectativas, y la volatilidad seguirá siendo bidireccional.
    ]

    #punto("03", "Bancos centrales: el ciclo restrictivo sigue en vigor")[
      El BoE sube 25 pb hasta el 4,00 % (8–1; Mann pidió 50 pb) y proyecta un pico de inflación del 4,8 %, con el 2 % solo a mediados de 2028. La Fed (3,75–4,00 %, dos disidentes a favor de subir) y el BCE (2,50 %, inflación del 3,8 %) mantienen sesgo restrictivo. Sin un Brent cómodamente por debajo de 90 \$, persiste el riesgo de una subida residual en diciembre.
    ]

    #seccion("Escenarios a tres meses")
    #tabla(columns: (1.6cm, 0.95cm, 1fr, 1.5cm, 1.9cm),
      align: (left, center, left, right, right),
      ("Escenario", "Prob.", "Narrativa", "Brent", "UST 10A"),
      ([*Favorable*], [20 %], [Pacto verificable con Irán y reapertura de Ormuz; pausa coordinada de bancos centrales.], [75–85 \$], [4,40–4,60 %]),
      ([*Base*], [55 %], [Bloqueo en Washington y desescalada sin firma; la inflación cede despacio.], [90–100 \$], [4,70–5,00 %]),
      ([*Adverso*], [25 %], [Ruptura en Ormuz; subida adicional de Fed y BCE; corrección de la renta variable superior al 10 %.], [>110 \$], [>5,10 %]),
    )
    #fuente[Probabilidades y rangos: estimación propia a 5-nov-2026; ilustrativos, no precios objetivo. Spot = cierre del 4-nov.]
    #v(sp.m)
    #grid(columns: (1fr, 1fr), column-gutter: gutter,
      rango("Brent · $/bbl", 70, 120, 94.62, "Spot 94,62",
        (([Favorable · 20 %], 75, 85, steel), ([Base · 55 %], 90, 100, corp), ([Adverso · 25 %], 110, 120, ink)),
        (70, 80, 90, 100, 110, 120), t => str(t)),
      rango("UST 10 años · %", 4.2, 5.4, 4.88, "Spot 4,88",
        (([Favorable · 20 %], 4.40, 4.60, steel), ([Base · 55 %], 4.70, 5.00, corp), ([Adverso · 25 %], 5.10, 5.40, ink)),
        (4.2, 4.6, 5.0, 5.4), t => { let u = str(calc.round(t, digits: 1)); (if u.contains(".") { u } else { u + ".0" }).replace(".", ",") }),
    )
    
    #seccion("Implicaciones tácticas por clase de activo")
    #tabla(columns: (2.05cm, 2.95cm, 1fr),
      ("Activo", "Sesgo", "Racional táctico"),
      ([Bonos EE.UU.], [#pill("Positivo", fuerte: true)], [Menos presión fiscal tras el bloqueo y menor oferta en largos (guía de _refunding_).]),
      ([Dólar (DXY)], [#pill("Neutral / bajista")], [Estrechamiento de diferenciales y menor prima política; refugio si se rompe la diplomacia.]),
      ([RV EE.UU.], [#pill("Neutral · rotación")], [Hiperescaladores y consumo doméstico frente a hardware de IA y defensa.]),
      ([Energía], [#pill("Infraponderar", fuerte: true)], [Venta táctica de prima geopolítica, con coberturas en la cola alcista.]),
      ([Libra (GBP)], [#pill("Soporte")], [BoE más restrictivo en el margen; vigilar el riesgo de estanflación.]),
    )
    #fuente[Opinión del equipo. Este documento no autoriza operaciones.]
  ],

  // =================== BARRA LATERAL ===================
  [
    #tarjeta("Market Snapshot · 4-nov")[
      #tabla(columns: (1fr, auto, auto), align: (left, right, right), size: 7.6pt, inset-y: 3.4pt,
        ("Activo", "Nivel", "Var."),
        ([Dow Jones], [53.356], chg("+3,03 %")),
        ([S&P 500], [7.689], chg("+1,58 %")),
        ([Nasdaq Comp.], [25.737], chg("+1,44 %")),
        ([Brent (\$/bbl)], [94,62], chg("−8,7 %")),
        ([UST 10 años], [4,88 %], chg("−7 pb")),
        ([Fed Funds], [3,75–4,00 %], [=]),
        ([BCE depósito], [2,50 %], [=]),
        ([Bank Rate UK], [4,00 %], chg("+25 pb")),
      )
    ]

    #tarjeta("Movimientos del 4-nov (%)")[
      #barras((
        ("Consumo discr.", 4.2),
        ("Dow Jones", 3.03),
        ("S&P 500", 1.58),
        ("Nasdaq Comp.", 1.44),
        ("Semis (SOX)", -3.8),
        ("Energía S&P", -4.8),
        ("Brent", -8.7),
      ))
    ]

    #tarjeta(grafico-titulo)[
  #let rows = grafico-datos.map(r => (r.at(0), str(r.at(1))))
  #let pts = rows.map(r => float(r.at(1)))
  #let lo = calc.floor(calc.min(..pts) * 10) / 10
  #let hi = calc.ceil(calc.max(..pts) * 10) / 10
  #let fmt(v) = { let s = str(calc.round(v, digits: 1)); (if s.contains(".") { s } else { s + ".0" }).replace(".", ",") }
  #let fmt2(v) = { let s = str(calc.round(v, digits: 2)); (if s.contains(".") { s } else { s + ".0" }).replace(".", ",") }
  #let W = 4.5cm
  #let H = 1.5cm
  #let n = pts.len()
  #let last = pts.at(n - 1)
  #let y(v) = H - H * (v - lo) / (hi - lo)
  #grid(columns: (auto, 1fr), column-gutter: 4pt,
    box(height: H, {
      for v in (lo, (lo + hi) / 2, hi) { place(left + horizon, dy: y(v) - H / 2, text(size: 5.8pt, fill: muted, number-type: "lining")[#fmt(v)]) }
      h(0.55cm)
    }),
    box(width: W, height: H, {
      for v in (lo, (lo + hi) / 2, hi) { place(dy: y(v), line(length: W, stroke: 0.3pt + rulec)) }
      place(curve(stroke: 1.2pt + corp, ..pts.enumerate().map(((i, v)) => { let p = (W * i / (n - 1), y(v)); if i == 0 { curve.move(p) } else { curve.line(p) } })))
      place(dx: W - 2pt, dy: y(last) - 2pt, circle(radius: 2pt, fill: red, stroke: none))
      place(dx: W - 1.55cm, dy: y(last) + 4pt, box(fill: white, inset: 1pt, text(size: 6pt, weight: w-semi, fill: red)[#fmt2(last) #grafico-unidad · #rows.at(n - 1).at(0).slice(8)/#rows.at(n - 1).at(0).slice(5, 7)]))
    }),
  )
  #box(width: 100%, height: 8pt, {
    let starts = rows.enumerate().filter(((i, r)) => i == 0 or r.at(0).slice(5, 7) != rows.at(i - 1).at(0).slice(5, 7))
    let names = ("01": "ene", "02": "feb", "03": "mar", "04": "abr", "05": "may", "06": "jun", "07": "jul", "08": "ago", "09": "sep", "10": "oct", "11": "nov", "12": "dic")
    for (i, r) in starts { place(dx: 0.55cm + 4pt + W * i / (n - 1), dy: 1pt, text(size: 5.8pt, fill: muted, names.at(r.at(0).slice(5, 7)))) }
  })
  #v(3pt)#fuente[#grafico-fuente]
]

    #tarjeta("Jueves 5-nov · Intradía")[
      *Giro en tecnología:* S&P 500 −2 % y Nasdaq −3,6~% (Nvidia −6,3 %, AMD −13,1 %). El alivio del miércoles se disipa en IA. \
      *Crudo rebota:* Brent +2,5 % hasta ≈97 \$; UST 10 años en el 4,86 %. \
      #text(size: 6.4pt, fill: muted, style: "italic")[Agregador; pendiente de contraste con el cierre.]
    ]

    #tarjeta("Tesis en seguimiento")[
      #grid(columns: (auto, 1fr), column-gutter: 7pt, row-gutter: 5pt, align: (left + top, left + top),
        pill("Se debilita"), [*D1 · ASML:* presión sectorial en semis; sin noticias propias.],
        pill("Sin cambios"), [*D2 · TIPS 10A:* tipo real pendiente de dato.],
        pill("Se refuerza", fuerte: true), [*D3 · Tesoro 2A:* Fed en pausa y curva a la baja.],
      )
    ]

    #block(width: 100%, fill: wash, stroke: (left: 2.5pt + corp), inset: (left: 10pt, right: 9pt, top: 7pt, bottom: 8pt), below: sp.m)[
      #block(below: sp.s + 2pt, rotulo("Criterios de invalidación"))
      #set text(size: 7.7pt)
      #set par(justify: false, leading: 0.5em)
      La tesis de descompresión decae si:
      #grid(columns: (auto, 1fr), column-gutter: 5pt, row-gutter: 3pt,
        text(fill: corp, weight: w-semi)[i.], [el Brent supera 105 \$ en dos cierres;],
        text(fill: corp, weight: w-semi)[ii.], [el UST 10 años cierra por encima del 5,05 %;],
        text(fill: corp, weight: w-semi)[iii.], [la Fed proyecta más de una subida en el #box[_dot plot_] del 9-dic.],
      )
    ]

    #tarjeta("Agenda y catalizadores")[
      #grid(columns: (auto, 1fr), column-gutter: 7pt, row-gutter: 3.5pt,
        [*Vie 6-nov*], [Empleo EE.UU. de octubre, 14:30],
        [*Mar 10-nov*], [IPC EE.UU. (octubre)],
        [*Sem. 9-nov*], [_Refunding_ del Tesoro, 125.000 M\$],
        [*Mié 9-dic*], [FOMC con proyecciones],
        [*Jue 17-dic*], [BCE y BoE],
      )
    ]
  ],
)
