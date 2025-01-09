SMB2J DISASSEMBLY - A COMPREHENSIVE SUPER MARIO BROS. 2 JAPAN DISASSEMBLY
by doppelganger (doppelheathen@gmail.com)

This is a disassembly of the program files that are part of Super Mario Bros 2 from Japan (not
to be confused with Super Mario Bros 2 USA, or Doki Doki Panic).  The source files are provided
for your use as-is.

Acknowledgements
----------------

There are so many people I have to thank for this, and I don't really remember them all.
First, I need to thank Beneficii for getting the ball rolling on a SMB2j reverse-engineering
project and for providing the disassembly which I compared notes with (but did not copy from
once again, I started working on this because he doesn't seem to have touched it in 3 years),
the peeps in the nesdev scene who helped me understand not only the 6502 and the NES, but 
also the Famicom Disk System and its nuances, as well as the authors of x816, asm6, and the 
reverse-engineers who did the original Super Mario Bros. Hacking project, which helped
me greatly in reverse-engineering Super Mario Bros. 1, which has an almost identical game engine
to this game.  I want to thank Nintendo for creating this game, the NES and the FDS, without 
which this disassembly would only be theory, and all my fellow peeps in the #nesdev channel
who inspired me to work on this by hacking SMB2j and discussing it and other projects with me 
themselves, as well as keeping me busy and engaged with conversation so I wouldn't get bored.

Instructions
------------

It consists of the following files:

sm2main.asm - assembles sm2main file (worlds 1-4, main engine)
sm2data2.asm - assembles sm2data2 file (worlds 5-8, some additional logic)
sm2data3.asm - assembles sm2data3 file (ending, world 9, additional music)
sm2data4.asm - assembles sm2data4 file (worlds A-D, some logic that's also in sm2data2)
fdswrap.asm - assembles an fds file out of the binaries of the previous files

The files all assemble with asm6.  The first four files can be assembled independently of the
others.  In order to assemble fdswrap.asm you must assemble the first four files, and provide
the necessary character ROM files from the original disk or an FDS disk image yourself.  Do *not* 
e-mail me asking for the assembled binaries or the character ROM files, or any other ROMs.

If you wish, you can automate the process by pasting the following to a batch file and running it,
replacing the blank field on the last line with the name of the final file.

----------- paste start
@echo off
asm6 sm2main.asm
asm6 sm2data2.asm
asm6 sm2data3.asm
asm6 sm2data4.asm
asm6 fdswrap.asm <insert name of file here>.fds
----------- paste end

Outro
-----
Anyway, that's the disassembly of SMB2j.  I hope somebody finds this as educational and illuminating
as I have, I had a lot of fun reverse-engineering it and SMB1.  See ya around.

-doppelganger