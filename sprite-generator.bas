1000 rem -----------------------------------------
1010 rem ------  just for the fun of it     ------
1020 rem -----------------------------------------
1030 rem a program to create the print string for
1040 rem printing a sprite definition to save
1050 rem memory and fast definition of the sprite.
1060 rem 
1070 rem the program will generate the basic program
1080 rem and saves it to disk. 
1090 rem -----------------------------------------
1100 dim bl(255)         : rem array to store basic line definition
1110 dm=2049             : rem base destination memory address
1120 sm=1024             : rem base screen destination address
1122 ln=100               : rem starting basic line number
1130 print chr$(147);       :rem clear screen
1140 print"---- generating the sprite strings ----" 
1150 for i = 0 to  2        : rem read sprites (3x)
1160 for x = 0 to 62        : rem data read loop
1170 read b                 : rem read data byte
1180 gosub 1460             : rem find corresponding value
1190 ps$(i)=ps$(i)+s$:s$="" : rem add petscii value(s) to the string
1200 next x                 : rem read next sprite data byte
1210 next i                 : rem read next sprite
1220 :: 
1230 rem --------------------------------------
1240 rem define the basic lines
1250 rem --------------------------------------
1254 ts=sm                : rem start address screen 
1256 tm=dm                : rem start 
1260 for l = 0 to 2
1270 d$=ps$(l)            : rem copy sprite definition
1310 gosub 1580 :tm=tm+ni : rem create basic line
1320 gosub 1810           : rem calculate next line start-adress
1330 gosub 1880 :ts=ts+ni : rem place basic line on screen memory
1340 ln=ln+10             : rem next basic line number
1350 next l               : rem convert next sprite data
1360 rem --------------------------------------
1370 rem place end  of basic program 
1380 rem --------------------------------------
1390 gosub 1750           : rem place end marker 
1400 gosub 1880 :ts=ts+2  : rem place basic line on screen memory
1410 gosub 1930           : rem save the memory block to disk 
1420 rem -------------------------------------   
1430   end
1440 rem -------------------------------------
1450 :: 
1460 rem --------------------------------------
1470 rem convert byte to corresponding chr value
1480 rem --------------------------------------
1490 if b <= 31             then s$=chr$(146)+chr$(64+b)
1500 if b >  31 and b <= 63 then s$=chr$(146)+chr$(b)
1510 if b >  63 and b <= 95 then s$=chr$(146)+chr$( 96+(b- 64))
1520 if b >  95 and b <=127 then s$=chr$(146)+chr$(160+(b- 96))
1530 if b > 127 and b <=159 then s$=chr$( 18)+chr$( 64+(b-128))
1540 if b > 159 and b <=191 then s$=chr$( 18)+chr$( 32+(b-160))
1550 if b > 191 and b <=223 then s$=chr$( 18)+chr$( 96+(b-192))
1560 if b > 223 and b <=255 then s$=chr$( 18)+chr$(160+(b-224))
1570 return
1580 rem --------------------------------------
1590 rem define 'print token and string basic start'
1600 rem --------------------------------------
1605 ni=2              : rem index at 2 (skip high/low next line address)
1610 bl(ni)=ln :ni=ni+1: rem line number low = 100
1615 bl(ni)=0  :ni=ni+1: rem line number high = 0*256
1620 bl(ni)=153:ni=ni+1: rem token for print
1625 bl(ni)=32 :ni=ni+1: rem space
1630 bl(ni)=34 :ni=ni+1: rem double quote
1670 rem --------------------------------------
1675 rem convert the string to the memory location
1680 rem -------------------------------------- 
1685 for i=1tolen(d$):bl(ni)=asc(mid$(d$,i,1)):ni=ni+1:next
1690 bl(ni)=34:ni=ni+1 : rem double quote
1695 bl(ni)=59:ni=ni+1 : rem semicolon
1700 bl(ni)=58 :ni=ni+1: rem command seperator :
1705 bl(ni)=142:ni=ni+1: rem return command token
1710 bl(ni)=0 :ni=ni+1 : rem end of line
1740 return
1750 rem -------------------------------------- 
1760 rem place end marker
1770 rem -------------------------------------- 
1780 bl(0)=0  : rem end marker next line high
1790 bl(1)=0  : rem end marker next line low
1800 return
1810 rem -------------------------------------- 
1820 rem Place the next line address at the front
1830 rem -------------------------------------- 
1840 ah=int(tm/256):al=tm-(ah*256)
1850 bl(0)=al          : rem next line start address low
1860 bl(1)=ah          : rem next line start address high
1870 return
1880 rem -------------------------------------- 
1890 rem place basic line at the memory address
1900 rem -------------------------------------- 
1910 for i=0 to ni-1:poke ts+i,bl(i):next
1920 return
1930 rem -------------------------------------- 
1940 rem saving routine 
1950 rem -------------------------------------- 
1960 sh% = int(sm/256) :sl = sm-sh%*256
1970 eh% = int(ts/256):el = ts-eh%*256
1980 sys 57812("@:test"),8,1 
1990 poke 193,sl:poke 194,sh%:poke 174,el:poke 175,eh%
2000 sys 62957
2010 return
2020 rem -------------------------------------
2030 rem old school sprite data in bytes
2040 rem -------------------------------------
2050 rem sprint 1
2060 data   0,   0,   0
2070 data   0,   0,   0
2080 data   0,   0,   0
2090 data   0,   8,   0
2100 data   2, 168,   0
2110 data  10, 250,   0
2120 data  11, 254,   0
2130 data  43, 187, 128
2140 data  15, 119, 128
2150 data  11, 255,   0
2160 data   3, 235,   0
2170 data   2, 252,   0
2180 data   2, 170,  48
2190 data  15, 155, 240
2200 data  14, 171,   0
2210 data   2, 154,   0
2220 data   2, 170,   0
2230 data   0, 184,   0
2240 data   0, 252,   0
2250 data   0, 204,   0
2260 data   3, 207,   0
2270 rem sprite 2
2280 data   0,   8,   0
2290 data   2, 168,   0
2300 data  10, 250,   0
2310 data  11, 254,   0
2320 data  43, 187, 128
2330 data  15, 119, 128
2340 data  11, 255,   0
2350 data   3, 191,   0
2360 data  50, 236,   0
2370 data  50, 170,   0
2380 data  15, 155,   0
2390 data   2, 171, 192
2400 data   2, 154,  48
2410 data   2, 170,  48
2420 data   0, 184,   0
2430 data   0, 252, 192
2440 data   0, 207, 192
2450 data   3, 192,   0
2460 data   0,   0,   0
2470 data   0,   0,   0
2480 data   0,   0,   0
2490 rem sprite 3
2500 data   0,   0,   0
2510 data   0,   0,   0
2520 data   0,   2,   0
2530 data   0,  10,   0
2540 data   2, 168,   0
2550 data  10, 250,   0
2560 data  11, 254,   0
2570 data  43, 187, 128
2580 data  15, 247, 128
2590 data  11, 255,   0
2600 data   3, 175,   0
2610 data  50, 252,   0
2620 data  50, 170,   0
2630 data  14, 154, 192
2640 data   2, 171, 192
2650 data   2, 154,  48
2660 data   2, 170,  48
2670 data  48, 184,   0
2680 data  15, 204, 192
2690 data   3, 195, 192
2700 data   0,   0,   0
