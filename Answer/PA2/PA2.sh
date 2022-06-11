ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/D &> /dev/null || ln -s ~/PA2assignment/dunnet ~/D

alias l='cd ->~/X; rm -f .v; disp; cd ~/D/objs'
alias disp='(ls .v >&~/X && head -1 description? || cat description? && echo > .v && hereitems 2>~/X || echo > .v)'
alias hereitems='ls [jkaflrse][aecmoiuh][ryiecblo]* &>~/X || ls *[deohi][daeni][rep] &>~/X && echo Here there is: `ls [jkaflrse][aecmoiuh][ryiecblo]* *[deohi][daeni][rep] 2>~/X`'

alias i='cd ->~/X && cd ~/D/inv && echo You currently have: `ls [jkabfglsr][aecmorlhiu]*[dterypl]` >&~/X; cd ->~/X && cd ~/D/objs'
alias x='(cat >../obj; cd ->~/X && (ls `cat ~/D/obj`>&~/X && cat `cat ~/D/obj`) && cd ~/D/objs || (cat ~/D/inv/`cat ~/D/obj`) || echo "I do not see that here.")2>~/X <'

alias u='cd ->~/X; cd u 2>~/X && disp || echo > temptxt; ls description[^F] >&~/X && ls ../u >&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias d='cd ->~/X; cd d 2>~/X && disp || echo > temptxt; ls description[^D] >&~/X && ls ../d >&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias cleanup='ls temptxt >&~/X && rm -f temptxt && echo You cannot go that way; cd `pwd -P` >&~/X; cd ~/D/objs'

alias n='cd ->~/X; cd n 2>~/X && disp || cat n 2>~/X || echo > temptxt; ls description[^C] >&~/X && (ls ../s || ls ../n)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias w='cd ->~/X; cd w 2>~/X && disp || cat w 2>~/X || echo > temptxt; ls description[^JKW] >&~/X && (ls ../w || ls ../e)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias s='cd ->~/X; cd s 2>~/X && disp || cat s 2>~/X || echo > temptxt; ls description[^HLNS] >&~/X && (ls ../s || ls ../n)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias e='cd ->~/X; cd e 2>~/X && disp || cat e 2>~/X || echo > temptxt; ls description[^OQ] >&~/X && (ls ../w || ls ../e)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias ne='cd ->~/X; cd ne 2>~/X && disp || cat ne 2>~/X || echo > temptxt; ls description[^E] >&~/X && (ls ../sw || ls ../ne)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias nw='cd ->~/X; cd nw 2>~/X && disp || cat nw 2>~/X || echo > temptxt; (ls ../nw || ls ../se)>&~/X && ls tempfile >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias sw='cd ->~/X; cd sw 2>~/X && disp || cat sw 2>~/X || echo > temptxt; ls description[^UZ] >&~/X && (ls ../sw || ls ../ne)>&~/X && ls temptxt >&~/X && rm -f temptxt && cd .. && disp; cleanup'
alias se='cd ->~/X; cd se 2>~/X && disp || ls se >&~/X || ls descriptionY >&~/X && ls checking >&~/X && cat se 2>~/X && exit || ls descriptionY >&~/X | echo > checking; cleanup'

cd ~/PA2assignment
rm -rf dunnet
tar -xf PA1.tar
cd ~/D/rooms
disp
cd ~/D/objs
PS1=">"

