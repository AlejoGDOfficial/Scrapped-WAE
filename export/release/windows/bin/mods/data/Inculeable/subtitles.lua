function onCreate()
    makeLuaText('inculeableText', '', screenWidth, 0, 0)
    setObjectCamera('inculeableText', 'camGame')
    setTextAlignment('inculeableText', 'CENTER')
    setTextSize('inculeableText', 175)
    addLuaText('inculeableText')
    setTextFont('inculeableText', 'nokiafc22.ttf')
    setTextBorder('inculeableText', 0)
end

function onCreatePost()
    setObjectOrder('inculeableText', getObjectOrder('duckHuntFieldGrass') + 1)
end

local curColor = nil

function changeText(text, size)
    if curColor == nil or curColor == '8B00FF' then
        curColor = 'FF0000'
    elseif curColor == 'FF0000' then
        curColor = 'FF7F00'
    elseif curColor == 'FF7F00' then
        curColor = 'FFFF00'
    elseif curColor == 'FFFF00' then
        curColor = '00FF00'
    elseif curColor == '00FF00' then
        curColor = '0000FF'
    elseif curColor == '0000FF' then
        curColor = '8B00FF'
    end

    setTextString('inculeableText', text)
    setTextColor('inculeableText', curColor)
    setProperty('inculeableText.y', screenHeight / 2 - getProperty('inculeableText.height') / 2)
    runTimer('changeTextColor', 5 / curBpm)
    if size ~= nil then
        setTextSize('inculeableText', size)
    end
end

function onTimerCompleted(tag)
    if tag == 'changeTextColor' then
        setProperty('inculeableText.color', getColorFromHex('FFFFFF'))
    end
end

function onStepHit()
    if curStep == 18 then
        changeText('WI')
    end
    if curStep == 22 then
        changeText('WI AR')
    end
    if curStep == 26 then
        changeText('WI AR ÑIN')
    end
    if curStep == 29 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 32 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 48 then
        changeText('UL')
    end
    if curStep == 50 then
        changeText('ULTI')
    end
    if curStep == 52 then
        changeText('ULTIMEIT')
    end
    if curStep == 56 then
        changeText('ULTIMEIT GAY')
    end
    if curStep == 60 then
        changeText('ULTIMEIT GAY SIS')
    end
    if curStep == 62 then
        changeText('ULTIMEIT GAY SISTEM')
    end
    if curStep == 80 then
        changeText('GÜI')
    end
    if curStep == 84 then
        changeText('GÜI CHA')
    end
    if curStep == 86 then
        changeText('GÜI CHALENSH')
    end
    if curStep == 91 then
        changeText('GÜI CHALENSH OL')
    end
    if curStep == 96 then
        changeText('GÜI CHALENSH OL PLE')
    end
    if curStep == 98 then
        changeText('GÜI CHALENSH OL PLEIERS')
    end
    if curStep == 112 then
        changeText('TU')
    end
    if curStep == 116 then
        changeText('TU CO')
    end
    if curStep == 118 then
        changeText('TU COMES')
    end
    if curStep == 120 then
        changeText('TU COMES PI')
    end
    if curStep == 124 then
        changeText('TU COMES PITO')
    end
    if curStep == 128 then
        changeText('TU COMES PIT')
    end
    if curStep == 129 then
        changeText('TU COMES PI')
    end
    if curStep == 130 then
        changeText('TU COMES P')
    end
    if curStep == 131 then
        changeText('TU COMES ')
    end
    if curStep == 132 then
        changeText('TU COMES')
    end
    if curStep == 133 then
        changeText('TU COME')
    end
    if curStep == 134 then
        changeText('TU COM')
    end
    if curStep == 135 then
        changeText('TU CO')
    end
    if curStep == 136 then
        changeText('TU C')
    end
    if curStep == 137 then
        changeText('TU ')
    end
    if curStep == 138 then
        changeText('TU')
    end
    if curStep == 139 then
        changeText('T')
    end
    if curStep == 140 then
        changeText('')
    end
    if curStep == 512 then
        changeText('WI')
    end
    if curStep == 516 then
        changeText('WI AR')
    end
    if curStep == 518 then
        changeText('WI AR ÑIN')
    end
    if curStep == 520 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 524 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 528 then
        changeText('TE')
    end
    if curStep == 530 then
        changeText('TE CU')
    end
    if curStep == 532 then
        changeText('TE CULEO')
    end
    if curStep == 534 then
        changeText('TE CULEO ÑIN')
    end
    if curStep == 536 then
        changeText('TE CULEO ÑINTEN')
    end
    if curStep == 540 then
        changeText('TE CULEO ÑINTENDO')
    end
    if curStep == 544 then
        changeText('TE')
    end
    if curStep == 546 then
        changeText('TE CU')
    end
    if curStep == 548 then
        changeText('TE CULEO')
    end
    if curStep == 550 then
        changeText('TE CULEO ÑIN')
    end
    if curStep == 552 then
        changeText('TE CULEO ÑINTEN')
    end
    if curStep == 556 then
        changeText('TE CULEO ÑINTENDO')
    end
    if curStep == 564 then
        changeText('IN', 150)
    end
    if curStep == 566 then
        changeText('INSIS')
    end
    if curStep == 568 then
        changeText('INSISTIEN')
    end
    if curStep == 572 then
        changeText('INSISTIENDO')
    end
    if curStep == 576 then
        changeText('INSISTIEND')
    end
    if curStep == 577 then
        changeText('INSISTIEN')
    end
    if curStep == 578 then
        changeText('INSISTIE')
    end
    if curStep == 579 then
        changeText('INSISTI')
    end
    if curStep == 580 then
        changeText('INSIST')
    end
    if curStep == 581 then
        changeText('INSIS')
    end
    if curStep == 582 then
        changeText('INSI')
    end
    if curStep == 583 then
        changeText('INS')
    end
    if curStep == 584 then
        changeText('IN')
    end
    if curStep == 585 then
        changeText('I')
    end
    if curStep == 586 then
        changeText('', 175)
    end
    if curStep == 832 then
        changeText('TU')
    end
    if curStep == 836 then
        changeText('TU CO')
    end
    if curStep == 838 then
        changeText('TU COMES')
    end
    if curStep == 840 then
        changeText('TU COMES PI')
    end
    if curStep == 844 then
        changeText('TU COMES PITO')
    end
    if curStep == 850 then
        changeText('TU')
    end
    if curStep == 852 then
        changeText('TU CO')
    end
    if curStep == 854 then
        changeText('TU COMES')
    end
    if curStep == 856 then
        changeText('TU COMES PI')
    end
    if curStep == 860 then
        changeText('TU COMES PITO')
    end
    if curStep == 864 then
        changeText('WI')
    end
    if curStep == 868 then
        changeText('WI AR')
    end
    if curStep == 870 then
        changeText('WI AR ÑIN')
    end
    if curStep == 872 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 876 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 880 then
        changeText('WI')
    end
    if curStep == 884 then
        changeText('WI AR')
    end
    if curStep == 886 then
        changeText('WI AR ÑIN')
    end
    if curStep == 888 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 892 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 898 then
        changeText('')
    end
    if curStep == 928 then
        changeText('TU')
    end
    if curStep == 932 then
        changeText('TU CO')
    end
    if curStep == 934 then
        changeText('TU COMES')
    end
    if curStep == 936 then
        changeText('TU COMES PI')
    end
    if curStep == 940 then
        changeText('TU COMES PITO')
    end
    if curStep == 944 then
        changeText('TU')
    end
    if curStep == 948 then
        changeText('TU CO')
    end
    if curStep == 950 then
        changeText('TU COMES')
    end
    if curStep == 952 then
        changeText('TU COMES PI')
    end
    if curStep == 956 then
        changeText('TU COMES PITO')
    end
    if curStep == 960 then
        changeText('')
    end
    if curStep == 992 then
        changeText('WI')
    end
    if curStep == 996 then
        changeText('WI AR')
    end
    if curStep == 998 then
        changeText('WI AR ÑIN')
    end
    if curStep == 1000 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 1004 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 1008 then
        changeText('WI')
    end
    if curStep == 1012 then
        changeText('WI AR')
    end
    if curStep == 1014 then
        changeText('WI AR ÑIN')
    end
    if curStep == 1016 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 1020 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 1024 then
        changeText('')
    end
    if curStep == 1056 then
        changeText('TU')
    end
    if curStep == 1060 then
        changeText('TU CO')
    end
    if curStep == 1062 then
        changeText('TU COMES')
    end
    if curStep == 1064 then
        changeText('TU COMES PI')
    end
    if curStep == 1068 then
        changeText('TU COMES PITO')
    end
    if curStep == 1072 then
        changeText('TU')
    end
    if curStep == 1076 then
        changeText('TU CO')
    end
    if curStep == 1078 then
        changeText('TU COMES')
    end
    if curStep == 1080 then
        changeText('TU COMES PI')
    end
    if curStep == 1084 then
        changeText('TU COMES PITO')
    end
    if curStep == 1088 then
        changeText('')
    end
    if curStep == 1344 then
        changeText('WI')
    end
    if curStep == 1348 then
        changeText('WI AR')
    end
    if curStep == 1352 then
        changeText('WI AR ÑIN')
    end
    if curStep == 1356 then
        changeText('WI AR ÑINTEN')
    end
    if curStep == 1358 then
        changeText('WI AR ÑINTENDO')
    end
    if curStep == 1360 then
        changeText('TU')
    end
    if curStep == 1364 then
        changeText('TU CO')
    end
    if curStep == 1366 then
        changeText('TU COMES')
    end
    if curStep == 1368 then
        changeText('TU COMES PI')
    end
    if curStep == 1372 then
        changeText('TU COMES PITO')
    end
    if curStep == 1376 then
        changeText('')
    end
    if curStep == 1488 then
        changeText('TU')
    end
    if curStep == 1492 then
        changeText('TU CO')
    end
    if curStep == 1494 then
        changeText('TU COMES')
    end
    if curStep == 1496 then
        changeText('TU COMES PI')
    end
    if curStep == 1500 then
        changeText('TU COMES PITO')
    end
    if curStep == 1504 then
        changeText('')
    end
    if curStep == 1712 then
        changeText('AIM')
    end
    if curStep == 1718 then
        changeText('AIM YOUR')
    end
    if curStep == 1724 then
        changeText('AIM YOUR ZAP')
    end
    if curStep == 1725 then
        changeText('AIM YOUR ZAPPER')
    end
    if curStep == 1727 then
        changeText('AIM YOUR ZAPPER GUN')
    end
    if curStep == 1736 then
        changeText('TU')
    end
    if curStep == 1742 then
        changeText('TU CO')
    end
    if curStep == 1745 then
        changeText('TU COMES')
    end
    if curStep == 1748 then
        changeText('TU COMES PI')
    end
    if curStep == 1751 then
        changeText('TU COMES PITO')
    end
    if curStep == 1760 then
        changeText('')
    end
end