function onCreate()
    makeLuaText('subtitles', '', screenWidth, 0, 0)
    setObjectCamera('subtitles', 'other')
    setTextSize('subtitles', 32)
    addLuaText('subtitles')
end
local text = nil
function onUpdate()
    setProperty('subtitles.x', screenWidth / 2 - getProperty('subtitles.width') / 2)
    setProperty('subtitles.y', 500 - getProperty('subtitles.height') / 2)
    setTextString('subtitles', text)
end
function onBeatHit()
    if curBeat == 261 then
        text = 'Ya viste todo lo que te da Movistar?'
    end
    if curBeat == 269 then
        text = 'Cambiate de una vez! Y el primer mes por solo 30 pesos'
    end
    if curBeat == 283 then
        text = 'Te damos 1200 MB para navegar'
    end
    if curBeat == 292 then
        text = 'Llamadas y redes sociales ilimitadas durante 30 dias'
    end
    if curBeat == 305 then
        text = 'Ademas, si quieres todos estos beneficios dos meses mas'
    end
    if curBeat == 321 then
        text = 'Solo recarga 100 pesos al mes para extenderlos'
    end
    if curBeat == 332 then
        text = 'Y si aun no te convence, esto seguro si!'
    end
    if curBeat == 343 then
        text = 'Te damos 300 MB mas en tu primer mes!'
    end
    if curBeat == 354 then
        text = 'Acercate y te contamos los detalles'
    end
    if curBeat == 363 then
        text = 'Movistar, elige todo'
    end
    if curBeat == 369 then
        text = ''
    end
    if curBeat == 645 then
        text = 'Ya viste todo lo que te da Movistar?'
    end
    if curBeat == 653 then
        text = 'Cambiate de una vez! Y el primer mes por solo 30 pesos'
    end
    if curBeat == 667 then
        text = 'Te damos 1200 MB para navegar'
    end
    if curBeat == 676 then
        text = 'Llamadas y redes sociales ilimitadas durante 30 dias'
    end
    if curBeat == 689 then
        text = 'Ademas, si quieres todos estos beneficios dos meses mas'
    end
    if curBeat == 705 then
        text = 'Solo recarga 100 pesos al mes para extenderlos'
    end
    if curBeat == 716 then
        text = 'Y si aun no te convence, esto seguro si!'
    end
    if curBeat == 727 then
        text = 'Te damos 300 MB mas en tu primer mes!'
    end
    if curBeat == 738 then
        text = 'Acercate y te contamos los detalles'
    end
    if curBeat == 747 then
        text = 'Movistar, elige todo'
    end
    if curBeat == 753 then
        text = ''
    end
end