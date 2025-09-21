100 print chr$(147)     : rem clear screen
110 dim bl(255)         : rem array to store basic line definition
120 dm=2049             : rem base destination memory address
130 sm=1024             : rem base screen destination address
140 rem --------------------------------------
150 rem define the first line of basic
160 rem --------------------------------------
170 d$="hello world en this is a bit longer string."    : rem demo string
180 ts=sm               : rem start address screen use for demo
190 tm=dm               : rem start 
200 ln=100              : rem starting basic line number
210 gosub 420 :tm=tm+ni : rem create first basic line
220 gosub 620           : rem place next line at the front
230 gosub 690 :ts=ts+ni : rem place basic line on screen memory
240 rem --------------------------------------
250 rem  define the second line of basic
260 rem --------------------------------------
270 d$="next line demo, the second string is longer." : rem next demo string
280 ln=110              : rem define next line-number
290 gosub 420 :tm=tm+ni : rem create next line
300 gosub 620           : rem place next line at the front
310 gosub 690 :ts=ts+ni : rem place basic line on screen memory
320 rem --------------------------------------
330 rem place end  of basic program 
340 rem --------------------------------------
350 gosub 560  : rem place end marker 
360 gosub 690  : ts=ts+2
370 gosub 740  : rem save the memory block to disk
380 end
390 rem --------------------------------------
400 rem define 'print token and string basic start'
410 rem --------------------------------------
420 ni=2              : rem index at 2 (skip high/low next line address)
430 bl(ni)=ln :ni=ni+1: rem line number low = 100
440 bl(ni)=0  :ni=ni+1: rem line number high = 0*256
450 bl(ni)=153:ni=ni+1: rem token for print
460 bl(ni)=32 :ni=ni+1: rem space
470 bl(ni)=34 :ni=ni+1: rem double quote
480 rem --------------------------------------
490 rem convert the string to the memory location
500 rem -------------------------------------- 
510 for i=1tolen(d$):bl(ni)=asc(mid$(d$,i,1)):ni=ni+1:next
520 bl(ni)=34:ni=ni+1 : rem double quote
530 bl(ni)=59:ni=ni+1 : rem semicolon
540 bl(ni)=0 :ni=ni+1 : rem end of line
550 return
560 rem -------------------------------------- 
570 rem place end marker
580 rem -------------------------------------- 
590 bl(0)=0  : rem end marker next line high
600 bl(1)=0  : rem end marker next line low
610 return
620 rem -------------------------------------- 
630 rem Place the next line address at the front
640 rem -------------------------------------- 
650 ah=int(tm/256):al=tm-(ah*256)
660 bl(0)=al          : rem next line start address low
670 bl(1)=ah          : rem next line start address high
680 return
690 rem -------------------------------------- 
700 rem place basic line at the memory address
710 rem -------------------------------------- 
720 for i=0 to ni-1:poke ts+i,bl(i):next
730 return
740 rem -------------------------------------- 
750 rem saving routine 
760 rem -------------------------------------- 
770 sh% = int(sm/256) :sl = sm-sh%*256
780 eh% = int(ts/256):el = ts-eh%*256
790 sys 57812("@:test"),8,1 
800 poke 193,sl:poke 194,sh%:poke 174,el:poke 175,eh%
810 sys 62957
820 return
