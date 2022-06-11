ls ~/X >& /dev/null || ln -s /dev/null ~/X
rm -f ~/D >&/dev/null; ln -s ~/PA4assignment/PA4dunnet ~/D

#alias hereitems '__1__' <==See README_PA4_hereitems for how to do this __1__.

#alias invitems '__2__' <==See README_PA4_invitems for how to do this __2__.

#Section to display the room description and contents:
#In this new assignment, we have a new problen related to the "panel lights"
# in the computer room inside the house. Consider:
#  (Suppose we type "emacs -batch -l dunnet", then "get shovel", then "e",
#Section to display the room description and contents:
#In this new assignment, we have a new problen related to the "panel lights"
# in the computer room inside the house. Consider:
#  (Suppose we type "emacs -batch -l dunnet", then "get shovel", then "e",
#  then "e", then "dig", then "get cpu", then "se", then "get food", then
#  "se", then "drop food", then "get key", then "nw", then "nw", then "ne",
#  then "ne", then "ne". If so, we'll be in the "Old Building hallway".)
#  Then, continuing on, we get:
#    >w
#    Computer room
#    You are in a computer room.  It seems like most of the equipment has
#    been removed.  There is a VAX 11/780 in front of you, however, with
#    one of the cabinets wide open.  A sign on the front of the machine
#    says: This VAX is named ‘pokey’.  To type on the console, use the
#    ‘type’ command.  The exit is to the east.
#    The panel lights are steady and motionless.
#    >
#    >
#    >e
#    Old Building hallway
#    >w
#    Computer room
#    The panel lights are steady and motionless.
#    >
#    >
#    >put cpu in vax
#    As you put the CPU board in the computer, it immediately springs to life.
#    The lights start flashing, and the fans seem to startup.
#    >l
#    Computer room
#    You are in a computer room.  It seems like most of the equipment has
#    been removed.  There is a VAX 11/780 in front of you, however, with
#    one of the cabinets wide open.  A sign on the front of the machine
#    says: This VAX is named ‘pokey’.  To type on the console, use the
#    ‘type’ command.  The exit is to the east.
#    The panel lights are flashing in a seemingly organized pattern.
#    >e
#    Old Building hallway
#    >w
#    Computer room
#    The panel lights are flashing in a seemingly organized pattern.
#    >
#    >
#    >drop key
#    Done.
#    >e
#    Old Building hallway
#    >w
#    Computer room
#    The panel lights are steady and motionless.
#    There is a key here.
#    >x panel
#    I don't know what that is.
#    >x lights
#    I don't know what that is.
#    >
#
#Looking at the above, we see four things:
# 1. A "panel lights" message always displays whenever the room is entered.
# 2. The "panel lights" message always displays just after the "Computer room"
#    message. That's to say: object messages (eg, the "There is a key here."
#    message, above) can only display after the "panel lights" message.
# 3. The "panel lights" message changes when you fix the computer.
# 4. The "panel lights" are not an object. You cannot "x panel" or "x lights".
#
#There are a variety of ways that we could achieve the above four behaviors.
#Our solution will be to modify the "disp" alias from PA3. To recall, PA3 had:
#alias disp='(ls .v &>~/X && head -1 de*||cat de*;echo >.v;hereitems;ls>~/X)'
#
#In this new version, we no longer need to use command cordination with disp,
#So the "(....;ls>~/X)" can be removed to simplified the PA3 solution to:
#alias disp='ls .v &> ~/X && head -1 de*||cat de*;echo >.v;hereitems'
#
#Looking above, we see that the "head -1" always displays the first line.
#But now we want to also display the last line, if it is about "panel lights".
#Therefore, you must replace the "head -1" with a sed program. In Lecture 9,
#We learned about a variety of sed commands that you can use to accomplish
#the behavior of: 1) printing the first line of the description file, and
#2) printing the last line -- if it involves "panel lights".
#
#So, in summary, fill in the __3__ blank below with a series of sed commands:
alias disp 'ls .v >&~/X && sed __3__ <de* || cat de*; echo >.v; hereitems'

#Here is a simple alias that I am giving you, so that PA4prog.csh can use it:
alias cdcont 'cd - >& ~/X && continue'

#The following code requires that the PA4assignment.tar file be expanded from
#your home directory:
cd ~/PA4assignment
rm -rf PA4dunnet
tar -xf PA4dunnet.tar
cd ~/D/rooms
disp
