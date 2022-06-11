#section 1
s/\(^\([nswe]\)\2[ ]\|^[nswe][nswe]$\|^[nswedu][ ]\|^[nswedu]$\).*/\1/;tCHECK;1s/^/@\n/
n;z;n;z;

:ERROR; n; s/ -> .*/-> /; s/^.* //; tERROR;
q;

#section2
:CHECK;h;N; s-.*/--;H;N; s/^.* //;H;
:NEXT1;N;s/ -> .*/->/; s/\nd.*/&->/; s/^.* //;H; s/.*//;$bELSE;tNEXT1;
:ELSE;g;

#section3
s/^\([neswdu][news]*\)\n/\1%@/;
s/\n/@/g;
/^\(.*\)%@.*@\1->.*/s/\(^.*\)%.*/cd \1/;tNEXT2;
:NEXT2;/^\(.*\)%@.*@\1@.*/s/^\(.*\)%.*/cat \1/;tPRINT;
s/^\(.*\)%.*/\1/;tCHANGE; 
:PRINT;p;
d;

#section4
:CHANGE;y/nswedu/snewud/

#section5
x;s/^.*\n\([nswedu][nswe]*\)\n.*/\1/; G; tNEXT3;
:NEXT3; /^\(.*\)\n\1$/s/.*/cd ../;tELSE2
s/.*/echo You can\'t go that way./
:ELSE2;q
