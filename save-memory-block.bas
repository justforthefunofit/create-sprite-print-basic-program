100 rem ----------------------------------
110 rem this a proof of concept to see how
120 rem we can make use of the standard
130 rem routines on the commodore to save
140 rem a particulate memory block. 
150 rem in that memory block we define a
160 rem basic program using the print
170 rem command and the conversion to get
180 rem the correct memory values.
190 rem ----------------------------------
200 print chr$(147);
210 ?chr$(32)+chr$(72)+chr$(164)+"@"+chr$(0)+chr$(32)+chr$(18)+chr$(89)+chr$(146)+chr$(32)+chr$(34)+"1234567890-1234567890"+chr$(34)+"@@@"
220 print "saving..."
230 sh% = 1024/256:sl = 1024-sh%*256
240 eh% = 1057/256:el = 1057-eh%*256
250 sys 57812("@:line-test"),8,1 
260 poke 193,sl:poke 194,sh%:poke 174,el:poke 175,eh%
270 sys 62957 
