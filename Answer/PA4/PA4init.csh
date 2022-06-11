ls ~/X >& /dev/null || ln -s /dev/null ~/X
rm -f ~/D >&/dev/null; ln -s ~/PA4assignment/PA4dunnet ~/D


alias hereitems 'ls [bagdjrflsk]*[^tgu][pterodactylA-Z] | sed "s/^[ag][cl].*[de]/packet of &/;s/acid/nitric &/;s/^[ra].*[yt]/valuable &/;s/^"\$"/glass jar/;s/^board/CPU card/;s/bear/ferocious &/;s/bone/dinosaur &/;s/b[o].*[r]"\$"/large &/;s/b[r].*[t]"\$"/emerald &/;s/key/shiny brass &/;s/l[i].*[e]/bus driver"\`"s &/;s/silver/& bar/;s/.*/There is a & here./;s/lamp here./lamp nearby./;s/a \([aeiou]\)/an \1/;s/.*jar:.*/The jar contains:/"|tr \\n @ |sed -n "s/:@There is a packet of nitric acid here./:@ \tThere is a packet of nitric acid here.:/;s/:@There is a packet of glycerine here./@ \tThere is a packet of glycerine here.:/;s/:@There is a nitric here.//;s/There is a [db][escripton]*[A-Za-z]* here.@//g;s/The jar contains:@"\$"//;s/:@"\$"/\n/;s/:@/:\n/;s/@/\n/gp;"'

alias invitems 'touch X && ls --color=never [^cen]* | sed "s/^[sjbkalr][iaoeurh].*/A &/;s/ boa/ computer&/;s/ si.*/& bar/;s/^[aeiou]/An &/;s/ k/ brass&/;s/^[gfn][loi].*/Some &/;s/^"\$"/A glass jar/;s/^An \(acid\)"\$"/Some nitric \1/;s/^X"\$"//;"|\grep .|tr \\n @|sed "s/A jar/The jar contains:/;s/:@Some nitric acid/:@ \tSome nitric acid:/;s/:@Some glycerine/@ \tSome glycerine:/;s/:@Some nitric//;s/The jar contains:@ \t"\$"//;s/:@/:\n/;s/@/\n/g;s/\(.*\):/\1/;s/\(.*\)::/\1:/";rm x'

alias disp 'ls .v >&~/X && sed -n "1p; s/The panel .*/&/p" <de* || cat de*; echo >.v; hereitems'


#Here is a simple alias that I am giving you, so that PA4prog.csh can use it:
alias cdcont 'cd - >& ~/X && continue'

#The following code requires that the PA4assignment.tar file be expanded from
#your home directory:
cd ~/PA4assignment
rm -rf PA4dunnet
tar -xf PA4dunnet.tar
cd ~/D/rooms
disp
