\ makemoney 2.1 - written by Leendert A. Hartog

: $var create dup here swap over c! over 1+ allot 1+ swap cmove does> ;
: $. count type ;
: unnumber 0 0 2swap >number ;
: signed ( check if the first char is a minus sign if so ignore first char and leave -1 on the stack else leave 1 ) over c@ 45 = if swap 1+ swap 1- -1 rot rot else 1 rot rot then ;
: make3 ( if value > 3 make it 3 ) dup 3 > if 3 swap drop then ;
: makemoney count signed unnumber ( check what's going on after the decimal point
								  make3 case 0 of endof
										     1 of endof
										     2 of 1+ 1 unnumber drop drop drop 10 * swap endof
											 3 of 1+ 2 unnumber drop drop drop swap endof 
										     endcase drop swap 100 * + * ;

S" 1234" $var amount1
S" 1234.56" $var amount2
S" 1234." $var amount3
S" 1234.5" $var amount9
S" 1234.567" $var amount5
S" -1234" $var amount6
S" -1234.56" $var amount7
S" -1234." $var amount8
S" -1234.567" $var amount10
S" 1234.5" $var amount9
S" -1234.5" $var amount10
										
 amount1  dup $. space makemoney . CR
 amount2  dup $. space makemoney . CR
 amount4  dup $. space makemoney . CR
 amount5  dup $. space makemoney . CR
 amount6  dup $. space makemoney . CR
 amount7  dup $. space makemoney . CR
 amount8  dup $. space makemoney . CR
 amount9  dup $. space makemoney . CR
 amount10 dup $. space makemoney . CR