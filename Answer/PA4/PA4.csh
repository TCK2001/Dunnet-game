#!/usr/bin/tcsh
#If needed, the above line may be changed to #!/usr/bin/csh, #!/bin/tcsh, etc.
#The following two lines are included to remind you to use them for debugging:
  #set echo
#  set verbose

#The following line runs the other .csh file that you need to make:
source ~/PA4assignment/PA4init.csh

#This is the game loop:
while ( 1 )

  #Section For Command Input:
  while ( 1 )
    # This section must do the following:
    #  1) Prompt the user with a ">".
    #  2) Read keyboard input.
    #  3) Create a array of all of the words entered from the keyboard input.
    #  4) If the input wasn't empty, break out of this while-loop
   
	set prompt = "> "
	echo -n "> "
	set X = $<:q
	set arr = ($X)
	if ( $#arr != 0 ) then 
		break
	endif
  end

  #Section For Movement:
  #Fill in the following blank (and you must use "=~" in your solution):
  if (  $arr[1] =~ [neswud] || $arr[1] =~ [nswe][nswe] ) then
    #Fill in the following blanks (and you must use "-f" in your solutions):
    if ( -f $arr[1] ) then
      if ( ( $arr[1] == ne ) && ( -f ~/D/inv/key ) ) then
        #In this case you're allowed to go back (northeast) through this door:
        cd ..; disp
      else
        #In all other cases, the presence of a file with the same name as the
        #direction indicates that you cannot move in that direction (just as
        #was the case in the previous programing assignments). Therefore, the
        #following line displays the file (and thus its message about moving):
        cat $arr[1]
      
        #Now, among all of the files named after directions, "se" is the only
        #file that can cause the player to die. Also, there is only one room
        #with an "se" file (the room with the bear). Therefore, the following
        #tests if the command was "se", and if it runs the exit command.
	#Your solution is required to use command coordination and the expr
	#command:
        expr $arr[1] = se >~/X && ls bear >~/X && exit
      endif

    #Fill in the following blanks (you must use "-d" & "-l" in your answers): 
    else if ( -d $arr[1] || -l $arr[1] ) then
      #In that case, fill in the blank to change into the requested directory:
      cd $arr; cd `pwd -P`; disp
      
    #Fill in the following blanks (you must use "-d" & "-l" in your answers): 
    else if ( $arr[1] == `pwd | rev | cut -d "/" -f1 | tr "nsweud" "snewdu" | rev ` ) then
      cd ..; disp
    else
      echo You cannot go that way.
    endif
    continue

  #Section for All Other Argument-Free Commands
  else if ( $arr[1] == quit ) then
    echo @You have scored 0 out of a possible 90 points.|tr @ \\n && exit

  else if ( $arr[1] == i || $arr[1] == inventory ) then
    #Note that the "invitems" and "cdcont" aliases are defined in PA4init.csh
    cd ~/D/inv; echo "You currently have:"; invitems; cdcont

  else if ( ( $arr[1] =~ [lx] || $arr[1] == look || $arr[1] == examine ) && \
            $#arr == 1 ) then
    rm .v >& ~/X; disp; continue

  else if (  $arr[1] == dig ) then
    if ( -f .cpu && -f ~/D/inv/shovel ) then
      mv .cpu cpu; cp cpu board; cp cpu card; cp cpu chip
      echo I think you found something. && continue
    else if ( -f ~/D/inv/shovel ) then
      echo Digging here reveals nothing. && continue
    else
      echo You have nothing with which to dig. && continue
    endif
  endif

  #Section To Check For A Valid Command:
  #At this point, we have already dealt with any legal commands that don't
  #require arguments. This section now checks for any commands that could
  #take an argument. If not, it prints "I don't understand that." and then
  #it runs the continue command.

  #Section To Check For A Invalid Object (Note the second word the user typed
  #is the "object"):
  if ( $#arr == 1 ) then
     echo You must supply an object. && continue

  else if ( ( !( -f ~/D/objs/$arr[2] ) ) || \
          ( $arr[2] == all ) && !( $arr[1] == get || $arr[1] == take ) ) then
     echo I do not know what that is. && continue
  
  else if ( ( $arr[1] == drop || $arr[1] == throw || $arr[1] == put ) &&\
            ( !( -f ~/D/inv/$arr[2] || -d ~/D/inv/$arr[2] ) ) ) then
     echo You don\'t have that. && continue

  else if ( ! ( $arr[1] == drop || $arr[1] == throw || $arr[1] == put ) && !( -f $arr[2]  || -d $arr[2] ) ) then
  
  #Now the object not being in the room leaves the possibility that it could
  #be in your inventory (but not if the command was drop/throw/put, because
  #we just checked for those commands, above).
  #
  #So there are two cases: get/take or l/look/x/examine:
     if ( $arr[1] == get || $arr[1] == take  ) then
       #If "get all" is typed, then "all" isn't an object, so avoid that case:
        if ( $arr[2] != all ) then
	   #There is a special case that get lets you get things out of the
	   #jar, but only if the jar is in your inventory:
			if ( !( -f ~/D/inv/jar/$arr[2] ) ) then
				echo I do not see that here. && continue
			endif
        endif
	
     #So now we know the command is "x" (or one of its synonyms). We also know
     #that the object isn't in the room. So if it isn't in the inventory (this
     #also allows it to be in the jar, if the jar is in the inventory):
     else if ( ( !( -f ~/D/inv/$arr[2] ) ) && ( !( -f ~/D/inv/jar/$arr[2] ) ) ) then
        echo I do not see that here. && continue
     endif
  endif


  #Section To Operate On An Object (most error situations won't reach here):
  
  #The following line uses "switch" to test the command the use typed:
  switch ( $arr[1] )
  
    #Section To handle "x" (and its synonyms):
    #Note each synonym case must go on its own line-- this is just a csh rule.
    case "l":
	case "x":
	case "look":
	case "examine":
        

      #Now that we know it is an "x" (or a synonym), we want to display the
      #object. But there are a few cases.

      #In the case of the jar, it has become a directory, not a file, so:
      ######if ( __Is_The_Object_A_Jar?__ ) echo It is a plain glass jar.
		if ( $arr[2] == "jar" ) then 
			echo It is a plain glass jar.
		else if ( -f $arr[2] ) then 
			cat $arr[2];
		else if ( -f ~/D/inv/$arr[2] ) then
			cat ~/D/inv/$arr[2];
		else if ( -f ~/D/inv/jar/$arr[2] ) then 
			cat ~/D/inv/jar/$arr[2];
		endif
		continue
      #The other possibilities are that the object is in: 1) the current
      #directory, 2) the inventory, or 3) the jar in the inventory. In each
      #case, you want to display the file from wherever it is found.
      #You may use as many commands as you wish, but you should remember that
      #cshell does not have the "2>" redirect, and the redirect of stdin and
      #stdout is ">&" (not "&>").
      

    #Section To handle "drop" (and its synonym):
    case "drop":
    case "throw":
      mv ~/D/inv/`echo $arr[2] | sed 's/^[an][ci].*/\[an\]\[ci\]\*/;s/^[cb][poha][uair].*/\[cb\]\[poha\]\[uair\]\*/;s/^[be][rm].*/\[be\]\[rm\]*/;s/.*/&/'` . > & ~/X && echo Done.
      if ( ( $arr[2] == food ) && ( -f bear ) ) then
        rm f* se bear &&mv .key key &&echo The bear takes the food and runs \
                                      away with it.  He left something behind.
      else if ( $arr[2] == jar ) then
        if ( ( -f jar/acid ) && ( -f jar/glycerine ) ) then
          rm -r jar &&\
	    echo As the jar impacts the ground it explodes into many pieces.
	endif
      endif
      continue
      
    #Section To handle "get" (and its synonym):
    case "get":
	case "take":
      # Section To Handle Getting Something Out Of The Jar.
      # Note: I have tested the original game, and you can only get things out
      # of the jar if you are holding the jar.
		mv ~/D/inv/jar/`echo $arr[2] | sed 's/^[an][ci].*/\[an\]\[ci\]\*/;s/.*/&/'` ~/D/inv/> & ~/X&& \
		echo You remove it from the jar. && continue

      #Now that the jar case is handled, we know that the object is supposed
      #to be in the room. The first step of getting the object is to determine
      #if it is getable. To accomplish this, we'll use the ~/D/get directory
      #from the previous programming assignment:
      mv [bceln][ahiom][^n]*[^nsrt] *[^handrest]?[dirtypuddle] ~/D/get >& ~/X

      #Since all of the gettable objects have now been moved to ~/D/get...
      if ( -f $arr[2] ) then
        mv ~/D/get/* . >& ~/X
	echo You cannot take that. && continue
      endif

      #In the next line, we go to ~/D/get. So we'll need to later do a "cd -"
      cd ~/D/get
      
      # Section To Handle "get all"
      # In the code below, __1__ checks for "all", __2__ checks if the present
      # directory (~/D/get) is empty, and __3__ is some sed "s" commands for
      # displaying the objects (eg, "acid" -> "Some nitric acid: Taken."),
      if ( $arr[2] == all ) then
        expr `ls ~/D/get | wc -l` == 0 >& ~/X && echo Nothing to take. && cdcont
		(invitems) | sed 's/You currently have://;s/.*/&: Taken./' && mv * ~/D/inv && cdcont
      endif
      
      # Section To Handle All Other Gets.
      # To remind, the code in PA3 for handling objects with aliases was:
      #  (cd ~/D;grep "^[cb][apho].*[upd]$" obj &&echo "[cb][apho]*[upd]">obj;
      #          grep "^[be][mr].*" obj&& echo "[be][mr]*">obj;
      #          grep "^[na][ic].*" ~/D/obj && echo "[na][ic]*" > obj; ...
      #          cd get; mv `cat ../obj` ../inv ) &>~/X; mv ~/D/get/*
      # Now in this new homework, there is no ~/D/obj file. Instead the name
      # of the object is held in a variable. The blanks below will need to
      # use "=~" along with wildcard patterns that are the same as those used
      # in PA3 (which I just reminded you about, above).
      echo Taken.
      if ( $arr[2] =~ [be][mr]* ) then
        mv [be][mr]* ~/D/inv
      else if ( $arr[2] =~ [na][ic]* ) then
        mv [na][ic]* ~/D/inv 
      else if ( $arr[2] =~ [cb][apoh][ruai]* ) then
        mv [cb][apoh][ruai]* ~/D/inv
      else 
        mv $arr[2] ~/D/inv 
      endif
      cd - >&~/X;
      mv ~/D/get/* . >& ~/X
      continue

      
    #Section To handle "put":
      #Section To test the indirect object
	case "put"
      if ( $#arr < 4 ) then
        echo You must supply an indirect object. && continue
      else if ( ! ( -f ~/D/objs/$arr[4] ) ) then
        echo I do not know what that indirect object is. && continue
      endif

      #The question now is: "Where is the indirect object?" Is it: 1) In the
      #present directory? or 2) the inventory, or 3) neither?
      #
      #At this point, you should add some lines here to create a variable
      #which holds the path to the indirect object (ie, "./" or "~/D/inv").
      #If the indirect object is in neither of those places, then this
      #variable should be made to not exist.
    
	  if ( -f $arr[4] || -d ~/D/inv/$arr[4] ) then
	  set S = "~/D/inv"
	  else if ( -f $arr[4] || -d $arr[4] ) then
	  set S = "."
	  else
		unset S
	  endif
      #Now we use the variable that we just created (if it was created):
      expr `echo "$?S"` != 1 >& ~/X && echo That indirect object is not here. && continue

      #The next part handles the putting of the chip into the computer.
      if ( $arr[3] == in && $arr[2] =~ [cb][apoh][ruai]* && $arr[4] =~ [civ]*[abe][trmx] ) then
         echo As you put the CPU board in the computer, it immediately springs to life.
         echo The lights start flashing, and the fans seem to startup.
         rm ~/D/inv/[cb][apoh][ruai]* 

	 #Note that the following had to send to a temporary file, X, because
	 #sed cannot send its output to the same place its input comes from:
         sed 's/steady.*/flashing in a seemingly organized pattern./'>X <des*
	 mv X descriptionR
 
      #The next part handles trying to put things that don't combine:
      else if ( ( $arr[2] != acid && $arr[2] != nitric &&$arr[2] != glycerine )|| $arr[4] != jar ) then
         echo I don\'t know how to combine those objects.  Perhaps you should
         echo just try dropping it.

      #This final part handles put correct things into the jar:
      else if ( $arr[2] == glycerine ) then
         mv ~/D/inv/$arr[2] $S/jar && echo Done.
      else
         mv ~/D/inv/`echo $arr[2] | sed "s/[an][ic].*/[an][ic]*/"` $S/jar && echo Done.
      endif
      continue
  endsw
end
