ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/D &> /dev/null || ln -s ~/PA3assignment/dunnet ~/D

alias x='(cat >../obj;cd ->~/X;cat `cat ~/D/obj` || (cd ~/D/inv && cat `cat ~/D/obj`)||echo "I do not see that here.")2>~/X < '
alias i='(cd ~/D/inv>~/X;echo -n "You currently have: "; ls [abfgjklrs]*[^s] 2> ~/X | u2d | tr "\r\n" ", " | rev | cut --complement -c 1-2 | rev ;echo .)| tr -d "\r\n" | fold; echo'

alias hereitems='(rm -f ~/D/T*/*;cp `ls -d * | grep ^[abfgjklrs]".\{0,6\}"[^gt][delprty]$ | tr ["\n"] ["\ "]` ~/D/T* &>~/X; cd ~/D;ls T*/* 2>~/X | u2d | tr ["\r"] ["@"] | grep -on -e "There is a" -e /[a-z]*\@ | grep -oe "There is a" -e :/[a].* -e /[^a].* | tr -d ["\n"] | tr ["@"] ["\n"] |  tr [":/"] ["n "] | u2d | tr ["\r"] [" "] | u2d | tr ["\r"] ["h"] | u2d |tr ["\r"] ["e"] | u2d | tr ["\r"] ["r"] | u2d | tr ["\r"] ["e"]| u2d | tr ["\r"] ["."])'

alias disp='(ls .v &>~/X && head -1 de*||cat de*;echo >.v;hereitems;ls>~/X)'
alias l='(cd ->~/X;rm .v;disp)'

alias drop='(cat >../obj; (cd ..; ls | grep '[na][ic][ti]' obj >&~/X && `echo echo "[na][ic][ti]*"` > obj; ls | grep '[be][rm][ea]' obj >&~/X && `echo echo "[be][rm][ea]*"` > obj; ls | grep '^[bc][poah].*[dup]$' obj >~/X && `echo echo "[bc][poah]*[dup]"` > obj); cd ->~/X; mv ~/D/inv/`cat ~/D/obj` . && echo Dropped. || echo You do not have that.)2>~/X <'

alias get='(cat >../obj;cd ->~/X;(mv [beflnscea][orahoimc][naomtoie]*[dpedclt] *[cjklun][paevbs][urye]* ~/D/get &>~/X; ls | grep -w `cat ~/D/obj` &>~/X && echo You can not take that. || (cd ~/D/get; cat ~/D/obj | fgrep -w 'all' >& ~/X && (ls [^cden]* &>~/X && echo Taken: `ls [^cden]*` | fold || echo Nothing to take.) || (ls | fgrep -w `cat ~/D/obj` >&~/X && echo Taken. || echo I do not see that here.))); (cd ~/D; ls | grep '[na][ic][ti]' obj >&~/X && `echo echo "[na][ic][ti]*"` > obj; ls | grep '[be][rm][ea]' obj >&~/X && `echo echo "[be][rm][ea]*"` > obj; ls | grep '^[bc][poah].*[dup]$' obj >~/X && `echo echo "[bc][poah]*[dup]"` > obj; ls | fgrep -w 'all' obj >&~/X && echo \* > obj; cd get; mv `cat ../obj` ../inv)&>~/X;mv ~/D/get/* .)2>~/X <'

alias cleanup='rm temp 2>~/X && echo "You cannot go that way.";cd `pwd -P`;cd ~/D/objs'
alias n='cd ->~/X;cd n 2>~/X && disp || cat n 2>~/X || echo >temp; rm ../s/temp 2>~/X && cd .. && disp; cleanup'
alias s='cd ->~/X;cd s 2>~/X && disp || echo >temp; rm ../n/temp 2>~/X && cd .. && disp; cleanup'
alias e='cd ->~/X;cd e 2>~/X && disp || cat e 2>~/X || echo >temp; rm ../w/temp 2>~/X && cd .. && disp; cleanup'
alias w='cd ->~/X;cd w 2>~/X && disp || echo >temp; rm ../e/temp 2>~/X && cd .. && disp; cleanup'
alias u='cd ->~/X;cd u 2>~/X && disp || echo >temp; rm ../d/temp 2>~/X && cd .. && disp; cleanup'
alias d='cd ->~/X;cd d 2>~/X && disp || echo >temp; rm ../u/temp 2>~/X && cd .. && disp; cleanup'
alias nw='cd ->~/X;cd nw 2>~/X && disp||cat nw 2>~/X||echo >temp; rm ../se/temp 2>~/X &&cd .. && disp; cleanup'
alias sw='cd ->~/X;cd sw 2>~/X && disp||echo >temp; rm ../ne/temp 2>~/X &&cd .. && disp; cleanup'
alias ne='cd ->~/X;cd ne 2>~/X && disp||cat ne 2>~/X||echo >temp; rm ../sw/temp 2>~/X &&cd .. && disp; cleanup'
alias se='cd ->~/X;cat se 2>~/X&&exit; cd se 2>~/X && disp||echo >temp; rm ../nw/temp 2>~/X &&cd .. && disp; cleanup'

cd ~/PA3assignment
rm -rf dunnet
tar -xf PA1.tar
cd ~/D/rooms
disp
cd ~/D/objs
PS1=">"