1000 rem -----------------------------------------
1010 rem ------  just for the fun of it     ------
1020 rem -----------------------------------------
1030 rem create string from sprite data
1040 rem that string can be used to print a sprite
1050 rem definition into memory in stead of using
1060 rem poke.
1070 rem -----------------------------------------
1080 print chr$(147);       :rem clear screen
1090 print"---- generating the sprite strings ----" 
1100 gosub 1400             : rem activate sprite
1110 for i = 0 to  2        : rem read sprites (3x)
1120 for x = 0 to 62        : rem data read loop
1130 read b                 : rem read data byte
1140 gosub 1280             : rem find corresponding value
1150 ps$(i)=ps$(i)+s$:s$="" : rem add petscii value(s) to the string
1160 next x                 : rem read next sprite data byte
1170 print chr$(19);ps$(i)  : rem print the result on screen
1180 next i                 : rem convert next sprite data
1190 rem ---------------------------------------
1200 rem ready show and animate the sprites 
1210 rem ---------------------------------------
1220 print chr$(19);ps$(0):for i=0to60:nexti:rem show first sprite
1230 print chr$(19);ps$(1):for i=0to60:nexti:rem show second sprite
1240 print chr$(19);ps$(2):for i=0to60:nexti:rem show third sprite
1250 goto 1220              : rem redo 
1260 rem --------------------------------------
1270 end : rem never reached just for info
1280 rem --------------------------------------
1290 rem convert byte to corresponding chr value
1300 rem --------------------------------------
1310 if b <= 31             then s$=chr$(146)+chr$(64+b)
1320 if b >  31 and b <= 63 then s$=chr$(146)+chr$(b)
1330 if b >  63 and b <= 95 then s$=chr$(146)+chr$( 96+(b- 64))
1340 if b >  95 and b <=127 then s$=chr$(146)+chr$(160+(b- 96))
1350 if b > 127 and b <=159 then s$=chr$( 18)+chr$( 64+(b-128))
1360 if b > 159 and b <=191 then s$=chr$( 18)+chr$( 32+(b-160))
1370 if b > 191 and b <=223 then s$=chr$( 18)+chr$( 96+(b-192))
1380 if b > 223 and b <=255 then s$=chr$( 18)+chr$(160+(b-224))
1390 return
1400 rem -------------------------------------
1410 rem show the sprite 1024 is start address
1420 rem -------------------------------------
1430 poke 53285,1   : rem multicolor 1 = white
1440 poke 53286,13  : rem multicolor 2 = lightgreen
1450 poke 53287,0   : rem sprite color = black
1460 poke 53269,1   : rem sprite 1 visible
1470 poke  2040,16  : rem pointer to 16x64 = 1024
1480 poke 53248,100 : rem x pos
1490 poke 53249,150 : rem y pos
1500 poke 53276, 1  : rem multicolor
1510 poke 53277, 0  : rem width
1520 poke 53271, 1  : rem height
1530 return
1540 rem -------------------------------------
1550 rem sprite data
1560 rem -------------------------------------
1570 rem sprint 1
1580 data   0,   0,   0
1590 data   0,   0,   0
1600 data   0,   0,   0
1610 data   0,   8,   0
1620 data   2, 168,   0
1630 data  10, 250,   0
1640 data  11, 254,   0
1650 data  43, 187, 128
1660 data  15, 119, 128
1670 data  11, 255,   0
1680 data   3, 235,   0
1690 data   2, 252,   0
1700 data   2, 170,  48
1710 data  15, 155, 240
1720 data  14, 171,   0
1730 data   2, 154,   0
1740 data   2, 170,   0
1750 data   0, 184,   0
1760 data   0, 252,   0
1770 data   0, 204,   0
1780 data   3, 207,   0
1790 rem sprite 2
1800 data   0,   8,   0
1810 data   2, 168,   0
1820 data  10, 250,   0
1830 data  11, 254,   0
1840 data  43, 187, 128
1850 data  15, 119, 128
1860 data  11, 255,   0
1870 data   3, 191,   0
1880 data  50, 236,   0
1890 data  50, 170,   0
1900 data  15, 155,   0
1910 data   2, 171, 192
1920 data   2, 154,  48
1930 data   2, 170,  48
1940 data   0, 184,   0
1950 data   0, 252, 192
1960 data   0, 207, 192
1970 data   3, 192,   0
1980 data   0,   0,   0
1990 data   0,   0,   0
2000 data   0,   0,   0
2010 rem sprite 3
2020 data   0,   0,   0
2030 data   0,   0,   0
2040 data   0,   2,   0
2050 data   0,  10,   0
2060 data   2, 168,   0
2070 data  10, 250,   0
2080 data  11, 254,   0
2090 data  43, 187, 128
2100 data  15, 247, 128
2110 data  11, 255,   0
2120 data   3, 175,   0
2130 data  50, 252,   0
2140 data  50, 170,   0
2150 data  14, 154, 192
2160 data   2, 171, 192
2170 data   2, 154,  48
2180 data   2, 170,  48
2190 data  48, 184,   0
2200 data  15, 204, 192
2210 data   3, 195, 192
2220 data   0,   0,   0


