# Pseudo-Productivity
Boost your "productivity" to the max! A project made for slackers by slackers.

**Note** This project was made just for fun. I do not condone use of these programs
in a professional work environment.

Created by: Kyle Lim

### Automated Test System (ATS)

<b>ATS.sh</b> - Simulates an Automated Test System. Uses tmux to open 4 panes to
run a keyserver, master, and slave in "docker"

Note: Run tmux before running the script! To exit, use tmux prefix & y to kill.
(prefix is default ctrl+b)

![ATS](https://raw.githubusercontent.com/kyle8998/Pseudo-Productivity/master/img/ATS.PNG)

##### ATS File Dependencies

keyServer.sh - Key server output

master.sh - Master output

slave.sh - Slave output

trigger.sh - Request trigger output

--------------------------------------------------------------------------------

### Bitbake

<b>fakeBitbake.sh</b> - Simulates a bitbake build. It requires the three files:
fakeBitbake.sh, bitbake.sh, and bitbakeargs.txt. It works by outputting the
normal bitbake text and some fake warnings and looping through an array of
bitbake arguments. It then uses echo carriages to change the tasks that it is
"bitbaking" to simulate that is it building something.

Note: Must use CTRL+C then type "pkill bash" to end due to background processes.
This may crash other programs (including real bitbake!) that are running bash.
Use with caution!

<b>printBitbake.sh</b> - Less sophisticated bitbake simulation. Simply prints
out bitbake. No background processes involved.

![ATS](https://raw.githubusercontent.com/kyle8998/Pseudo-Productivity/master/img/bitbake.PNG)

##### Bitbake File Dependencies

bitbakeArgs.txt - Contains all bitbake arguments for fakeBitbake.sh

initial.sh - Script that prints out initial burst for fakeBitbake.sh

pipedBitbake.txt - Contains the content for printBitbake.sh

--------------------------------------------------------------------------------

### NeuralNetwork

<b>trainNN.py</b> - Creates a neural network and trains it to solve the XOR
problem. The catch is that it outputs its training process every cycle for
a million cycles.

<b>trainNN_rand.py</b> - Creates a neural network and constantly feeds it
random training sets which ultimately leads to useless data. It outputs the
training process with the outputs, weights, and error calculations.

![ATS](https://raw.githubusercontent.com/kyle8998/Pseudo-Productivity/master/img/nn.PNG)

<b>Dependency:</b> Must have Numpy python module installed

--------------------------------------------------------------------------------

<b>codeReview.rb</b> - Retrieves random code from codereview and outputs it in a
way that makes it look like you are typing the code.

![ATS](https://raw.githubusercontent.com/kyle8998/Pseudo-Productivity/master/img/codereview.PNG)

Dependency: Ruby 2.1.0+ and Nokogiri gem

--------------------------------------------------------------------------------

<b>everything.sh</b> - Simply outputs everything from every file on your system.
Use with caution!

--------------------------------------------------------------------------------

<b>fakeCompilation.sh</b> - Emulates gcc by pulling lines from /usr/include and
including them with a gcc flag.

--------------------------------------------------------------------------------

<b>hackerTyper.rb</b> - Retrieves random code from hackertyper and outputs it in
a way that makes it look like you are typing the code.

--------------------------------------------------------------------------------

<b>hexSearch.sh</b> - Randomly outputs hexidecimal numbers and highlights
random numbers to make it simulate a search.

![ATS](https://raw.githubusercontent.com/kyle8998/Pseudo-Productivity/master/img/hexsearch.PNG)

--------------------------------------------------------------------------------

More coming soon!