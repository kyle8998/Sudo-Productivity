# Fake-Work
Make it look like you're working

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

##### Bitbake File Dependencies

bitbakeArgs.txt - Contains all bitbake arguments for fakeBitbake.sh

initial.sh - Script that prints out initial burst for fakeBitbake.sh

pipedBitbake.txt - Contains the content for printBitbake.sh

--------------------------------------------------------------------------------

### NeuralNetwork

<b>Dependency:</b> Must have Numpy python module installed

<b>trainNN.py</b> - Creates a neural network and trains it to solve the XOR
problem. The catch is that it outputs its training process every cycle for
a million cycles.

<b>trainNN_rand.py</b> - Creates a neural network and constantly feeds it
random training sets which ultimately leads to useless data. It outputs the
training process with the outputs, weights, and error calculations.

--------------------------------------------------------------------------------

<b>everything.sh</b> - Simply outputs everything from every file on your system.
Use with caution!

--------------------------------------------------------------------------------

<b>fakeCompilation.sh</b> - Emulates gcc by pulling lines from /usr/include and
including them with a gcc flag.

--------------------------------------------------------------------------------

<b>hexSearch.sh</b> - Randomly outputs hexidecimal numbers and highlights
random numbers to make it simulate a search.

--------------------------------------------------------------------------------
