function onCreatePost()
    makeLuaText("subtitles", "", screenWidth, 0, 0)
    setObjectCamera("subtitles", "other")
    addLuaText("subtitles")
end
local alejo = ""
local text = ""
local size = 64
function onUpdatePost()
    subtitlesX = screenWidth / 2 - getProperty("subtitles.width") / 2
    subtitlesY = screenHeight / 2 - getProperty("subtitles.height") / 2
	setProperty("subtitles.x", subtitlesX + getRandomFloat(getProperty("shake.x") * -1, getProperty("shake.x")))
	setProperty("subtitles.y", subtitlesY + getRandomFloat(getProperty("shake.x") * -1, getProperty("shake.x")))
	setProperty("subtitles.angle", getRandomFloat(getProperty("shake.angle") * -1, getProperty("shake.angle")))
	if getProperty("shake.y") == 1 then
		setProperty("subtitles.angle", math.sin(t * 16) * 6.25)
	end
	setTextString("subtitles", text)
	setTextSize("subtitles", size)
	if alejo == "" then
        setTextColor("subtitles", "FF00FF")
        setTextFont("subtitles", "comicSans.ttf")
		setProperty("shake.x", 12.5)
		setProperty("shake.angle", 3.125)
		setProperty("shake.y", 0)
	end
	if alejo == "og" then
        setTextColor("subtitles", "FFFFFF")
        setTextFont("subtitles", "vcr.ttf")
		setProperty("shake.x", 6.25)
		setProperty("shake.angle", 1.5625)
		setProperty("shake.y", 0)
	end
end
function onBeatHit()
	if curBeat == 1024 then
		text = "All the suffering that you caused us"
	end
	if curBeat == 1032 then
		text = "You should pay"
	end
	if curBeat == 1040 then
		text = "But none of this will matter"
	end
	if curBeat == 1048 then
		text = "Because this is going to END"
	end
	if curBeat == 1056 then
		text = ""
	end
	if curBeat == 1076 then
		text = "Your suffering has just begun"
	end
	if curBeat == 1084 then
		text = ""
	end
	if curBeat == 1088 then
		text = "Don't worry"
	end
	if curBeat == 1092 then
		text = "This won't be very long"
	end
	if curBeat == 1096 then
		text = "All nine minutes will last"
	end
	if curBeat == 1104 then
		text = "This is not just any song"
	end
	if curBeat == 1108 then
		text = "In which you..."
	end
	if curBeat == 1112 then
		text = "YOU WILL SUFFER IN EVERY NOTE"
	end
	if curBeat == 1120 then
		text = ""
	end
	if curBeat == 1140 then
		text = "OG, never cared you"
	end
	if curBeat == 1148 then
		text = ""
	end
	if curBeat == 1152 then
		text = "Let's start at once"
	end
	if curBeat == 1160 then
		text = "I have so much to remind you"
	end
	if curBeat == 1168 then
		text = "Betrayals"
	end
	if curBeat == 1170 then
		text = "Tricks"
	end
	if curBeat == 1172 then
		text = "A lot of shit"
	end
	if curBeat == 1176 then
		text = "You already know all this"
	end
	if curBeat == 1184 then
		text = ""
	end
	if curBeat == 1200 then
		text = "WHERE IS YOUR FUCKING BF?"
	end
	if curBeat == 1208 then
		text = "WHERE IS YOUR FUCKING BF? (x2)"
	end
	if curBeat == 1216 then
		text = "Let that son of a bitch come"
	end
	if curBeat == 1224 then
		text = "If he dares"
	end
	if curBeat == 1228 then
		text = "Or is it that hunger won't let him?"
	end
	if curBeat == 1236 then
		text = "...let him?"
	end
	if curBeat == 1240 then
		text = "Damn Venezuelan"
	end
	if curBeat == 1248 then
		text = "Finish this"
	end
	if curBeat == 1252 then
		text = "Or EXTEND it"
	end
	if curBeat == 1256 then
		text = "I'm surprised you're still here"
	end
	if curBeat == 1264 then
		text = "Screw you"
	end
	if curBeat == 1266 then
		text = "Screw you (x2)"
	end
	if curBeat == 1268 then
		text = "Screw you (x3)"
	end
	if curBeat == 1270 then
		text = "SCREW YOU (x4)"
	end
	if curBeat == 1272 then
		text = "And stop screwing with me"
	end
	if curBeat == 1280 then
		text = ""
	end
	if curBeat == 1300 then
		text = "Stop talking now!"
	end
	if curBeat == 1308 then
		text = ""
	end
	if curBeat == 1332 then
		text = "Your words only hurt!"
	end
	if curBeat == 1340 then
		text = ""
	end
	if curBeat == 1344 then
		text = "All"
	end
	if curBeat == 1347 then
		text = "The"
	end
	if curBeat == 1350 then
		text = "Shit"
	end
	if curBeat == 1352 then
		text = "You"
	end
	if curBeat == 1355 then
		text = "Told"
	end
	if curBeat == 1358 then
		text = "Me"
	end
	if curBeat == 1360 then
		text = "Does"
	end
	if curBeat == 1363 then
		text = "Not"
	end
	if curBeat == 1366 then
		text = "Make"
	end
	if curBeat == 1368 then
		text = "A-"
	end
	if curBeat == 1371 then
		text = "Any"
	end
	if curBeat == 1374 then
		text = "Sense"
	end
	if curBeat == 1376 then
		text = "All"
	end
	if curBeat == 1379 then
		text = "The"
	end
	if curBeat == 1382 then
		text = "Shit"
	end
	if curBeat == 1384 then
		text = "You"
	end
	if curBeat == 1387 then
		text = "Told"
	end
	if curBeat == 1390 then
		text = "Me"
	end
	if curBeat == 1392 then
		text = "Does"
	end
	if curBeat == 1395 then
		text = "Not"
	end
	if curBeat == 1398 then
		text = "Make"
	end
	if curBeat == 1400 then
		text = "A-"
	end
	if curBeat == 1403 then
		text = "Any"
	end
	if curBeat == 1406 then
		text = "Sense"
	end
	if curBeat == 1408 then
		text = ""
	end
	if curBeat == 1472 then
		text = "STOP"
	end
	if curBeat == 1474 then
		text = ""
	end
	if curBeat == 1476 then
		text = "STOP"
	end
	if curBeat == 1478 then
		text = ""
	end
	if curBeat == 1480 then
		text = "S-"
	end
	if curBeat == 1481 then
		text = "STOP"
	end
	if curBeat == 1482 then
		text = "STOP SING-"
	end
	if curBeat == 1483 then
		text = "STOP SINGING"
	end
	if curBeat == 1484 then
		text = "STOP SINGING NOW"
	end
	if curBeat == 1486 then
		text = ""
	end
	if curBeat == 1487 then
		text = "YOU"
	end
	if curBeat == 1488 then
		text = "YOU BAS-"
	end
	if curBeat == 1490 then
		text = ""
	end
	if curBeat == 1492 then
		text = "YOU BASTARD"
	end
	if curBeat == 1494 then
		text = ""
	end
	if curBeat == 1496 then
		text = "OR"
	end
	if curBeat == 1497 then
		text = "OR I'LL"
	end
	if curBeat == 1498 then
		text = "OR I'LL MAKE"
	end
	if curBeat == 1499 then
		text = "OR I'LL MAKE YOU"
	end
	if curBeat == 1500 then
		text = "OR I'LL MAKE YOU CRY"
	end
	if curBeat == 1502 then
		text = ""
	end
	if curBeat == 1504 then
		text = "STOP"
	end
	if curBeat == 1506 then
		text = ""
	end
	if curBeat == 1508 then
		text = "STOP"
	end
	if curBeat == 1510 then
		text = ""
	end
	if curBeat == 1512 then
		text = "S-"
	end
	if curBeat == 1513 then
		text = "STOP"
	end
	if curBeat == 1514 then
		text = "STOP SING-"
	end
	if curBeat == 1515 then
		text = "STOP SINGING"
	end
	if curBeat == 1516 then
		text = "STOP SINGING NOW"
	end
	if curBeat == 1518 then
		text = ""
	end
	if curBeat == 1519 then
		text = "YOU"
	end
	if curBeat == 1520 then
		text = "YOU BAS-"
	end
	if curBeat == 1522 then
		text = ""
	end
	if curBeat == 1524 then
		text = "YOU BASTARD"
	end
	if curBeat == 1526 then
		text = ""
	end
	if curBeat == 1528 then
		text = "OR"
	end
	if curBeat == 1529 then
		text = "OR I'LL"
	end
	if curBeat == 1530 then
		text = "OR I'LL MAKE"
	end
	if curBeat == 1531 then
		text = "OR I'LL MAKE YOU"
	end
	if curBeat == 1532 then
		text = "OR I'LL MAKE YOU CRY"
	end
	if curBeat == 1534 then
		text = ""
	end
	if curBeat == 1600 then
		text = "REPENT OF YOUR SINS"
	end
	if curBeat == 1608 then
		text = "REPENT OF YOUR SINS\nREPENT OF YOUR SINS"
	end
	if curBeat == 1616 then
		text = "REPENT OF YOUR SINS\nREPENT OF YOUR SINS\nREPENT OF YOUR SINS"
	end
	if curBeat == 1624 then
		text = "REPENT OF YOUR SINS\nREPENT OF YOUR SINS\nREPENT OF YOUR SINS\nREPENT OF YOUR SINS"
	end
	if curBeat == 1632 then
		text = "Forget about your existence"
	end
	if curBeat == 1640 then
		text = "Forget about your existence\nForget about your existence"
	end
	if curBeat == 1648 then
		text = "Forget about your existence\nForget about your existence\nForget about your existence"
	end
	if curBeat == 1656 then
		text = "Forget about all your shit"
	end
	if curBeat == 1664 then
		text = "Think"
	end
	if curBeat == 1666 then
		text = "Think about"
	end
	if curBeat == 1668 then
		text = "Think about your"
	end
	if curBeat == 1670 then
		text = "Think about your actions"
	end
	if curBeat == 1672 then
		text = "Think"
	end
	if curBeat == 1674 then
		text = "Think about"
	end
	if curBeat == 1676 then
		text = "Think about your"
	end
	if curBeat == 1678 then
		text = "Think about your actions"
	end
	if curBeat == 1680 then
		text = "Think"
	end
	if curBeat == 1682 then
		text = "Think about"
	end
	if curBeat == 1684 then
		text = "Think about your"
	end
	if curBeat == 1686 then
		text = "Think about your actions"
	end
	if curBeat == 1688 then
		text = "Think"
	end
	if curBeat == 1690 then
		text = "Think about"
	end
	if curBeat == 1692 then
		text = "Think about your"
	end
	if curBeat == 1694 then
		text = "Think about your actions"
	end
	if curBeat == 1696 then
		text = "Does your head hurt?"
	end
	if curBeat == 1700 then
		text = "Is there anything you are doing about it?"
	end
	if curBeat == 1704 then
		text = "Do you like flashing lights?"
	end
	if curBeat == 1708 then
		text = "Do you enjoy this?"
	end
	if curBeat == 1712 then
		text = "That's not good"
	end
	if curBeat == 1720 then
		text = "Do you like suffering?"
	end
	if curBeat == 1728 then
		text = ""
	end
	if curBeat == 1732 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1740 then
		text = ""
	end
	if curBeat == 1748 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1756 then
		text = ""
	end
	if curBeat == 1764 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1772 then
		text = ""
	end
	if curBeat == 1780 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1788 then
		text = ""
	end
	if curBeat == 1792 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1800 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1808 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1816 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1824 then
		text = "The Beginning Of A New Era"
	end
	if curBeat == 1832 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1840 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1848 then
		text = "The Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era\nThe Beginning Of A New Era"
	end
	if curBeat == 1924 then
		text = "Do you want this again?"
	end
	if curBeat == 1928 then
		text = "No problem!"
	end
	if curBeat == 1932 then
		text = "I have a lot of time"
	end
	if curBeat == 1936 then
		text = "PLEASE"
	end
	if curBeat == 1940 then
		text = "END"
	end
	if curBeat == 1942 then
		text = "MY"
	end
	if curBeat == 1944 then
		text = "SUFFERING"
	end
	if curBeat == 1948 then
		text = "It's your turn to talk"
	end
	if curBeat == 1952 then
		text = ""
	end
	if curBeat == 1988 then
		text = "I'm sorry"
	end
	if curBeat == 1992 then
		text = "For everything"
	end
	if curBeat == 1996 then
		text = "That happened a few moments ago"
	end
	if curBeat == 2000 then
		text = "I have been upset"
	end
	if curBeat == 2004 then
		text = "Be patient with me"
	end
	if curBeat == 2008 then
		text = "Maybe that can help you"
	end
	if curBeat == 2016 then
		text = ""
	end
	if curBeat == 2052 then
		text = "You'll soon understand"
	end
	if curBeat == 2060 then
		text = "How shit betrayal feels"
	end
	if curBeat == 2068 then
		text = "And so you will understand our suffering"
	end
	if curBeat == 2080 then
		text = ""
	end
	if curBeat == 2112 then
		text = "MILKZZZ - JANUARY"
	end
	if curBeat == 2116 then
		text = "It's only a matter of time"
	end
	if curBeat == 2124 then
		text = "Before the cigarette takes effect"
	end
	if curBeat == 2136 then
		text = "E-"
	end
	if curBeat == 2138 then
		text = "EFFECT"
	end
	if curBeat == 2140 then
		text = "EFFECT ON"
	end
	if curBeat == 2142 then
		text = "EFFECT ON YOU"
	end
	if curBeat == 2144 then
		text = ""
	end
	if curBeat == 2176 then
		text = "It will be funny"
	end
	if curBeat == 2180 then
		text = "When I see"
	end
	if curBeat == 2184 then
		text = "How your actions"
	end
	if curBeat == 2188 then
		text = "Hurt you"
	end
	if curBeat == 2192 then
		text = "PERMANENTLY"
	end
	if curBeat == 2194 then
		text = "And you cannot"
	end
	if curBeat == 2198 then
		text = "CHANGE"
	end
	if curBeat == 2200 then
		text = "All the shit you caused in someone"
	end
	if curBeat == 2208 then
		text = "Until someone returns you the..."
	end
	if curBeat == 2222 then
		text = "FAVOR"
	end
	if curBeat == 2224 then
		text = "You can continue"
	end
	if curBeat == 2228 then
		text = "Until you die"
	end
	if curBeat == 2232 then
		text = "Sing while you can"
	end
	if curBeat == 2240 then
		text = ""
	end
	if curBeat == 2304 then
		text = "Maybe Nataly will make you think"
	end
	if curBeat == 2308 then
		text = "Maybe NATHALY will make you think"
	end
	if curBeat == 2312 then
		text = "As it should be"
	end
	if curBeat == 2318 then
		text = "I SHOULD"
	end
	if curBeat == 2320 then
		text = "STOP INSULTING YOU"
	end
	if curBeat == 2326 then
		text = "But I can't do it"
	end
	if curBeat == 2336 then
		text = "Let's get back to the topic"
	end
	if curBeat == 2340 then
		text = "You should kill yourself now"
	end
	if curBeat == 2344 then
		text = "Do it at once"
	end
	if curBeat == 2348 then
		text = "DO"
	end
	if curBeat == 2349 then
		text = "DO IT"
	end
	if curBeat == 2350 then
		text = "DO IT AT"
	end
	if curBeat == 2351 then
		text = "DO IT AT ONCE"
	end
	if curBeat == 2352 then
		text = "You never paid him atention"
	end
	if curBeat == 2360 then
		text = "YOU JUST IGNORED HIM"
	end
	if curBeat == 2368 then
		text = ""
	end
	if curBeat == 2432 then
		text = "Do you remember your..."
	end
	if curBeat == 2436 then
		text = "FUCKING FRIENDS"
	end
	if curBeat == 2438 then
		text = "FUCKING FRIENDS\nFUCKING FRIENDS"
	end
	if curBeat == 2440 then
		text = "They..."
	end
	if curBeat == 2442 then
		text = "WILL PAY"
	end
	if curBeat == 2444 then
		text = "For all your mistakes"
	end
	if curBeat == 2448 then
		text = "Damn fucking Alex"
	end
	if curBeat == 2452 then
		text = "I'm aware that he is not to blame for anything that happens to me"
	end
	if curBeat == 2462 then
		text = "BUT THAT DOESN'T CARE ME"
	end
	if curBeat == 2468 then
		text = "He must suffer"
	end
	if curBeat == 2472 then
		text = "NE-"
	end
	if curBeat == 2474 then
		text = "NEVER"
	end
	if curBeat == 2475 then
		text = "NEVER MORE"
	end
	if curBeat == 2477 then
		text = "NEVER MORE THAN"
	end
	if curBeat == 2478 then
		text = "NEVER MORE THAN YOU"
	end
	if curBeat == 2480 then
		text = "Failed abortion"
	end
	if curBeat == 2484 then
		text = "Welcome to my fucking kingdom"
	end
	if curBeat == 2488 then
		text = "Where you will not hide"
	end
	if curBeat == 2496 then
		text = ""
	end
	if curBeat == 2560 then
		text = "End YOUR fucking life"
	end
	if curBeat == 2564 then
		text = ""
	end
	if curBeat == 2568 then
		text = "End MY fucking life"
	end
	if curBeat == 2572 then
		text = ""
	end
	if curBeat == 2576 then
		text = "End OUR fucking life"
	end
	if curBeat == 2580 then
		text = ""
	end
	if curBeat == 2584 then
		text = "End THEIR fucking life"
	end
	if curBeat == 2588 then
		text = ""
	end
	if curBeat == 2592 then
		text = "End this, don't start this, don't continue with this, before it's too late, end my suffering, end your suffering, end your life, end my life too"
	end
	if curBeat == 2624 then
		text = "End YOUR fucking life"
	end
	if curBeat == 2628 then
		text = ""
	end
	if curBeat == 2632 then
		text = "End MY fucking life"
	end
	if curBeat == 2636 then
		text = ""
	end
	if curBeat == 2640 then
		text = "End OUR fucking life"
	end
	if curBeat == 2644 then
		text = ""
	end
	if curBeat == 2648 then
		text = "End THEIR fucking life"
	end
	if curBeat == 2652 then
		text = ""
	end
	if curBeat == 2656 then
		text = "End this, don't start this, don't continue with this, before it's too late, end my suffering, end your suffering, end your life, end my life too"
	end
	if curBeat == 2676 then
		text = "End the FUCKING asshole..."
	end
	if curBeat == 2680 then
		text = "PAIN"
	end
	if curBeat == 2684 then
		text = "PAIN\nPAIN\nPAIN"
	end
	if curBeat == 2688 then
		text = "NOW"
	end
	if curBeat == 2696 then
		text = ""
	end
	if curBeat == 2704 then
		text = "Repeat last message"
		alejo = 'og'
	end
	if curBeat == 2712 then
		text = "10-9"
	end
	if curBeat == 2716 then
		text = ""
	end
	if curBeat == 3032 then
		text = "THE BEGINNING OF A NEW ERA"
		alejo = ""
	end
	if curBeat == 3040 then
		text = "Maria, this is not over yet"
	end
	if curBeat == 3051 then
		text = "Yet"
	end
	if curBeat == 3054 then
		text = "Shit"
	end
	if curBeat == 3056 then
		text = "We will see us again"
	end
	if curBeat == 3064 then
		text = "See us again"
	end
	if curBeat == 3072 then
		text = ""
	end
	if curBeat == 3104 then
		text = "Remember than at our next meeting"
	end
	if curBeat == 3120 then
		text = "Piety will be null"
	end
	if curBeat == 3128 then
		text = "Everything will be exposed"
	end
	if curBeat == 3136 then
		text = ""
	end
	if curBeat == 3168 then
		text = "It's just a matter of time"
	end
	if curBeat == 3184 then
		text = ""
	end
	if curBeat == 3200 then
		text = "It's just a matter of time"
	end
	if curBeat == 3216 then
		text = ""
	end
end
function onStepHit()
	if curStep == 6012 then
		text = "!#$%&/()="
	end
	if curStep == 6013 then
		text = "=!#$%&/()"
	end
	if curStep == 6014 then
		text = ")=!#$%&/("
	end
	if curStep == 6015 then
		text = "()=!#$%&/"
	end
	if curStep == 6140 then
		text = "!#$%&/()="
	end
	if curStep == 6141 then
		text = "=!#$%&/()"
	end
	if curStep == 6142 then
		text = ")=!#$%&/("
	end
	if curStep == 6143 then
		text = "()=!#$%&/"
	end
	if curStep == 6144 then
		text = ""
	end
	if curStep >= 7424 and curStep < 7456 then
		if curStep % 4 == 0 then
			text = "!#$%&/()="
		end
		if curStep % 4 == 1 then
			text = "=!#$%&/()"
		end
		if curStep % 4 == 2 then
			text = ")=!#$%&/("
		end
		if curStep % 4 == 3 then
			text = "()=!#$%&/"
		end
	end
	if curStep == 7456 then
		text = ""
	end
	if curStep == 14976 then
		size = 128
		text = "Mr. Soup"
	end
	if curStep == 14978 then
		text = "Alex"
	end
	if curStep == 14980 then
		text = "Burzi"
	end
	if curStep == 14982 then
		text = "Alex"
	end
	if curStep == 14984 then
		text = "Erick"
	end
	if curStep == 14986 then
		text = "Alex"
	end
	if curStep == 14988 then
		text = "Nicolas"
	end
	if curStep == 14990 then
		text = "Alex"
	end
	if curStep == 14992 then
		text = "Stiven"
	end
	if curStep == 14994 then
		text = "Alex"
	end
	if curStep == 14996 then
		text = "Burzi"
	end
	if curStep == 14998 then
		text = "Alex"
	end
	if curStep == 15000 then
		text = "Erick"
	end
	if curStep == 15002 then
		text = "Alex"
	end
	if curStep == 15004 then
		text = "Isai"
	end
	if curStep == 15006 then
		text = "Alex"
	end
	if curStep == 15008 then
		text = "Juan"
	end
	if curStep == 15010 then
		text = "Alex"
	end
	if curStep == 15012 then
		text = "Hormiga"
	end
	if curStep == 15014 then
		text = "Alex"
	end
	if curStep == 15016 then
		text = "Sebastian"
	end
	if curStep == 15018 then
		text = "Alex"
	end
	if curStep == 15020 then
		text = "Ketchup"
	end
	if curStep == 15022 then
		text = "Alex"
	end
	if curStep == 15024 then
		text = "Jeimy"
	end
	if curStep == 15026 then
		text = "Alex"
	end
	if curStep == 15028 then
		text = "FoxyElPirata46"
	end
	if curStep == 15030 then
		text = "Alex"
	end
	if curStep == 15032 then
		text = "Milkzzz"
	end
	if curStep == 15034 then
		text = "Alex"
	end
	if curStep == 15036 then
		text = "Josu"
	end
	if curStep == 15038 then
		text = "Alex"
	end
	if curStep == 15040 then
		text = "Kera"
	end
	if curStep == 15044 then
		text = "Void"
	end
	if curStep == 15048 then
		text = "Kazut"
	end
	if curStep == 15052 then
		text = "TO"
	end
	if curStep == 15056 then
		text = "Daniel"
	end
	if curStep == 15060 then
		text = "Lizy"
	end
	if curStep == 15064 then
		text = "DM"
	end
	if curStep == 15068 then
		text = "Galaxy"
	end
	if curStep == 15072 then
		text = "GD"
	end
	if curStep == 15076 then
		text = "OG"
	end
	if curStep == 15080 then
		text = "Killer"
	end
	if curStep == 15088 then
		text = "Alejo GD Official"
	end
	if curStep == 15096 then
		text = "The Screwed One"
	end
	if curStep == 15104 then
		text = "Angel"
	end
	if curStep == 15106 then
		text = "Rob"
	end
	if curStep == 15108 then
		text = "Jean Bravo"
	end
	if curStep == 15112 then
		text = "Speakerman"
	end
	if curStep == 15114 then
		text = "Cameraman"
	end
	if curStep == 15116 then
		text = "TV Woman"
	end
	if curStep == 15120 then
		text = "DaFuq!?Booom!"
	end
	if curStep == 15122 then
		text = "Muzik Digitim"
	end
	if curStep == 15124 then
		text = "Toilets"
	end
	if curStep == 15128 then
		text = "Maria"
	end
	if curStep == 15132 then
		text = "Alejandra"
	end
	if curStep == 15136 then
		text = "GF"
	end
	if curStep == 15138 then
		text = "Crybaby"
	end
	if curStep == 15140 then
		text = "Melanie"
	end
	if curStep == 15144 then
		text = "Lemon Cake"
	end
	if curStep == 15148 then
		text = "Cutter"
	end
	if curStep == 15152 then
		text = "Needle"
	end
	if curStep == 15158 then
		text = "Thread"
	end
	if curStep == 15164 then
		text = "Mouth"
	end
	if curStep == 15168 then
		text = "Week-"
	end
	if curStep == 15174 then
		text = "Weekend"
	end
	if curStep == 15180 then
		text = "Af-"
	end
	if curStep == 15184 then
		text = "After-"
	end
	if curStep == 15190 then
		text = "Afternoon"
	end
	if curStep == 15196 then
		text = "Ex-"
	end
	if curStep == 15200 then
		text = "Exten-"
	end
	if curStep == 15206 then
		text = "Extended"
	end
	if curStep == 15212 then
		text = "2-"
	end
	if curStep == 15216 then
		text = "2.-"
	end
	if curStep == 15222 then
		text = "2.3"
	end
	if curStep == 15228 then
		text = "Is"
	end
	if curStep == 15232 then
		text = "GONE"
	end
	if curStep == 15264 then
		text = ""
	end
end