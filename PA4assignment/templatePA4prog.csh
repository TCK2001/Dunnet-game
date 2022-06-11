#!/usr/bin/tcsh
#If needed, the above line may be changed to #!/usr/bin/csh, #!/bin/tcsh, etc.
#The following two lines are included to remind you to use them for debugging:
#  set echo
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
    ...
  end

  #Section For Movement:
  #Fill in the following blank (and you must use "=~" in your solution):
  if ( __Was_The_Command_A_Direction_To_Move?__ ) then
    #Fill in the following blanks (and you must use "-f" in your solutions):
    if ( __Was_The_Command_A_File_The_Current_Directory?__ ) then
      if ( ( __Are_You_SW_Of_The_House?_)) && ( __Do_You_Have_A_Key?_ ) ) then
        #In this case you're allowed to go back (northeast) through this door:
        cd ..; disp
      else
        #In all other cases, the presence of a file with the same name as the
        #direction indicates that you cannot move in that direction (just as
        #was the case in the previous programing assignments). Therefore, the
        #following line displays the file (and thus its message about moving):
        cat __1__
      
        #Now, among all of the files named after directions, "se" is the only
        #file that can cause the player to die. Also, there is only one room
        #with an "se" file (the room with the bear). Therefore, the following
        #tests if the command was "se", and if it runs the exit command.
	#Your solution is required to use command coordination and the expr
	#command:
        __1__ && __2__
      endif

    #Fill in the following blanks (you must use "-d" & "-l" in your answers): 
    else if ( __Was_The_Command_A_Directory_Or_A_Link?__ ) then
      #In that case, fill in the blank to change into the requested directory:
      cd __1__; cd `pwd -P`; disp
      
    #Fill in the following blanks (you must use "-d" & "-l" in your answers): 
    else if ( __Is_Current_Directory_Name_Opposite_To_New_Direction?__ ) then
      cd ..; disp
    else
      echo You cannot go that way.
    endif
    continue

  #Section for All Other Argument-Free Commands
  else if ( __Was_"quit"_The_Command?__ ) then
    echo @You have scored 0 out of a possible 90 points.|tr @ \\n && exit

  else if ( __Was_"i"_Or_"inventory"_The_Command?__ ) then
    #Note that the "invitems" and "cdcont" aliases are defined in PA4init.csh
    cd ~/D/inv; echo "You currently have:"; invitems; cdcont

  else if ( ( __Was_"l"_Or_"look"_Or_"x"_Or_"examine"_The_Command?__ ) && \
            __Did_The_Command_Have_No_Object_ie,_Is_The_Array_Size_1?__ ) then
    rm .v >& ~/X; disp; continue

  else if ( __Was__"dig"_The_Command?__ ) then
    if ( __Are_The)Conditions_Correct_For_Finding_The_CPU_Board?__ ) then
      mv .cpu cpu; cp cpu board; cp cpu card; cp cpu chip
      echo I think you found something. && continue
    else if ( __Do_You_Have_The_Shovel?__ ) then
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
  ...  <== Put any commands here you want, so as to check for a valid command

  #Section To Check For A Invalid Object (Note the second word the user typed
  #is the "object"):
  if ( __Was_No_Object_Given?__ ) then
     echo You must supply an object. && continue

  else if ( ( __Is_The_Object_Not_A_File_In_~/D/objs__ ) || \
          ( __Is_The_Object_"all"_&&_Is_The_Command_Not_"get/take"?__ ) ) then
     echo I do not know what that is. && continue
  
  else if ( ( __Is_The_Command_Is_"drop"_"throw"_Or_"put"?__ ) &&\
            ( __Is_The_Object_Not_In_Your_Inventory?__ ) ) then
     echo You don\'t have that. && continue

  else if ( __Is_The_Object_Not_In_The_Current_Room__ ) then
  #Now the object not being in the room leaves the possibility that it could
  #be in your inventory (but not if the command was drop/throw/put, because
  #we just checked for those commands, above).
  #
  #So there are two cases: get/take or l/look/x/examine:
     if ( __Is_The_Command_"get"_Or_"take"?__  ) then
       #If "get all" is typed, then "all" isn't an object, so avoid that case:
        if ( __Is_The_Object_Not_"all"__ ) then
	   #There is a special case that get lets you get things out of the
	   #jar, but only if the jar is in your inventory:
	   if ( __Is_The_Object_Not_In_The_"~/D/inv/jar"_Directory?__ ) then
              echo I do not see that here. && continue
           endif
        endif
	
     #So now we know the command is "x" (or one of its synonyms). We also know
     #that the object isn't in the room. So if it isn't in the inventory (this
     #also allows it to be in the jar, if the jar is in the inventory):
     else if ( __Is_The_Object_Not_In "~/D/inv"_Or_"~/D/inv/jar/"?__ ) then
        echo I don\'t see that here. && continue
     endif
  endif


  #Section To Operate On An Object (most error situations won't reach here):
  
  #The following line uses "switch" to test the command the use typed:
  switch ( __1__ )
  
    #Section To handle "x" (and its synonyms):
    #Note each synonym case must go on its own line-- this is just a csh rule.
    __1__
    __2__
    __3__
    __4__
      #Now that we know it is an "x" (or a synonym), we want to display the
      #object. But there are a few cases.

      #In the case of the jar, it has become a directory, not a file, so:
      if ( __Is_The_Object_A_Jar?__ ) echo It is a plain glass jar.

      #The other possibilities are that the object is in: 1) the current
      #directory, 2) the inventory, or 3) the jar in the inventory. In each
      #case, you want to display the file from wherever it is found.
      #You may use as many commands as you wish, but you should remember that
      #cshell does not have the "2>" redirect, and the redirect of stdin and
      #stdout is ">&" (not "&>").
      ...
      continue

    #Section To handle "drop" (and its synonym):
    __1__
    __2__
      __Move_The_Object_From_The_Inventory_To_The_Current_Room__ && echo Done.
      if ( __Is_The_Object_Food?__ && __Is_The_Bear_Here?__ ) then
        rm f* se bear &&mv .key key &&echo The bear takes the food and runs \
                                      away with it.  He left something behind.
      else if ( __Is_The_Object_The_Jar?__ ) then
        if ( __Is_The_Jar_Full?__ ) then
          rm _Flag(s)_And_Argument(s)_To_Remove_The_Jar_AND_Its_Contents__ &&\
	    echo As the jar impacts the ground it explodes into many pieces.
	endif
      endif
      continue
      
    #Section To handle "get" (and its synonym):
    __1__
    __2__
      # Section To Handle Getting Something Out Of The Jar.
      # Note: I have tested the original game, and you can only get things out
      # of the jar if you are holding the jar.
      mv __Try_Moving_The_Object_From_The_Jar_In_The_Inventory__ \
         __To_Just_The_Inventory__ __And_Send_Errors_To_~/X_  && \
          echo You remove it from the jar. && continue

      #Now that the jar case is handled, we know that the object is supposed
      #to be in the room. The first step of getting the object is to determine
      #if it is getable. To accomplish this, we'll use the ~/D/get directory
      #from the previous programming assignment:
      mv [bceln][ahiom][^n]*[^nsrt] *[^handrest]?[dirtypuddle] ~/D/get >& ~/X

      #Since all of the gettable objects have now been moved to ~/D/get...
      if ( __Does_The_Current_Room_Still_Contain_The_Object?__ ) then
        mv ~/D/get/* . >& ~/X
	echo You cannot take that. && continue
      endif

      #In the next line, we go to ~/D/get. So we'll need to later do a "cd -"
      cd ~/D/get
      
      # Section To Handle "get all"
      # In the code below, __1__ checks for "all", __2__ checks if the present
      # directory (~/D/get) is empty, and __3__ is some sed "s" commands for
      # displaying the objects (eg, "acid" -> "Some nitric acid: Taken."),
      if ( __1__ ) then
        expr __2__ && echo Nothing to take. && cdcont
        (invitems) | sed '__3__' && mv * ~/D/inv && cdcont
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
      if ( __Is_The_Object_The_Emerald_Bracelet__ ) then
         mv __Put_The_Emerald_And_Bracelet_Into_The_Inventory
      if ( __Is_The_Object_The_Nitric_Acid__ ) then
         mv __Put_The_Nitric_And_Acid_Into_The_Inventory
      if ( __Is_The_Object_The_CPU_Chip_Board_Card__ ) then
         mv __Put_The_CPU_Chip_Board_And_Card_Into_The_Inventory
      else 
         mv __Put_The_Object_(Which_We_Know_Has_No_Synonym)_Into_The_Inventory
      endif
      cd - >&~/X;
      mv ~/D/get/* . >& ~/X
      continue

      
    #Section To handle "put":
    __1__
      #Section To test the indirect object
      if ( __Were_There_Less_Than_Four_Words_Typed_From_The_Keyboard?__ ) then
        echo You must supply an indirect object. && continue
      else if ( __Is_The_Indirect_Object_Not_In_"~/D/objs/"?__ ) then
        echo I do not know what that indirect object is. && continue
      endif

      #The question now is: "Where is the indirect object?" Is it: 1) In the
      #present directory? or 2) the inventory, or 3) neither?
      #
      #At this point, you should add some lines here to create a variable
      #which holds the path to the indirect object (ie, "./" or "~/D/inv").
      #If the indirect object is in neither of those places, then this
      #variable should be made to not exist.
      ...

      #Now we use the variable that we just created (if it was created):
      expr __Does_The_Variable_Exist?__ && echo That indirect object is not \
         here. && continue

      #The next part handles the putting of the chip into the computer.
      if ( __Are_You_Trying_To_Put_The_Card/Chip/CPU/Board_Into_The_Vax/IBM/Cabinet/Computer?__ ) then
         echo As you put the CPU board in the computer, it immediately springs to life.
         echo The lights start flashing, and the fans seem to startup.
         rm __One_Pattern_For_The_Card_Chip_CPU_And_Board__

	 #Note that the following had to send to a temporary file, X, because
	 #sed cannot send its output to the same place its input comes from:
         sed 's/steady.*/flashing in a seemingly organized pattern./'>X <des*
	 mv X descriptionR
 
      #The next part handles trying to put things that don't combine:
      else if ( __Is_The_Object_Neither_The_Nitric_Acid_Nor_The_Glycerine__||\
                __Is_The_Indirect_Object_Not_The_Jar__ ) then
         echo I don\'t know how to combine those objects.  Perhaps you should
         echo just try dropping it.

      #This final part handles put correct things into the jar:
      else if ( __Is_The_Object_Glycerine?__ ) then
         mv __Put_The_Glycerine_Into_The_Jar__ && echo Done.
      else
         mv __Put_Both_Acid_Synonyms_Into_The_Jar__ && echo Done.
      endif
      continue
  endsw
end
