-- Almuñécar Capital: notas sin caja + tablas factsheet a ancho completo
-- envuelve bloques (ojo: table.unpack en medio de una tabla Lua solo devuelve el primero)
local function wrap(a,content,b)
  local out=pandoc.List{pandoc.RawBlock('latex',a)}
  out:extend(content); if b~='' then out:insert(pandoc.RawBlock('latex',b)) end
  return out
end
function Div(el)
  if el.classes:includes("onepager") then
    return wrap('\\begin{onepager}', el.content, '\\end{onepager}')
  end
  if el.classes:includes("fuente") then
    return wrap('\\begin{fuente}', el.content, '\\end{fuente}')
  end
  if el.classes:includes("anexo") then
    local t=el.attributes["titulo"] or "Anexo"
    return wrap('\\anexotitulo{'..t..'}', el.content, '')
  end
  if el.classes:includes("notice") then
    return wrap('\\begin{quote}', el.content, '\\end{quote}')
  end
end
local function txt(c) return pandoc.utils.stringify(c.contents) end
-- modo: diario | completo (por defecto completo)
function Meta(m)
  local modo = m.modo and pandoc.utils.stringify(m.modo) or "completo"
  if modo=="diario" then m.diario=true else m.completo=true end
  return m
end
function Table(tbl)
  local n=#tbl.colspecs
  -- anchos proporcionales al contenido (ancho completo)
  local w={}; local tot=0
  local rows={}
  for _,r in ipairs(tbl.head.rows) do table.insert(rows,r) end
  for _,b in ipairs(tbl.bodies) do for _,r in ipairs(b.body) do table.insert(rows,r) end end
  for j=1,n do
    local mx=4
    for _,r in ipairs(rows) do local c=r.cells[j]; if c then mx=math.max(mx, math.min(60, utf8.len(txt(c)) or 0)) end end
    w[j]=mx; tot=tot+mx
  end
  for j=1,n do tbl.colspecs[j][2]=0.98*w[j]/tot end
  -- columnas numéricas a la derecha
  for j=2,n do
    local num,cnt=0,0
    for _,b in ipairs(tbl.bodies) do for _,r in ipairs(b.body) do local c=r.cells[j]; if c then cnt=cnt+1
      local t=txt(c):gsub('%s',''); if t:match('^[%-−+≈~]?[%d][%d.,–/%%$€xpbM()+−]*') and utf8.len(t)<24 then num=num+1 end end end end
    if cnt>0 and num/cnt>=0.6 then tbl.colspecs[j][1]=pandoc.AlignRight end
  end
  -- cabecera en versalitas pequeñas color corporativo
  for _,r in ipairs(tbl.head.rows) do
    for _,c in ipairs(r.cells) do
      local inl=pandoc.utils.blocks_to_inlines(c.contents)
      local t={pandoc.RawInline('latex','\\fshead{')}
      for _,i in ipairs(inl) do table.insert(t,i) end
      table.insert(t,pandoc.RawInline('latex','}'))
      c.contents={pandoc.Plain(t)}
    end
  end
  return tbl
end
