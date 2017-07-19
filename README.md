# Fake-Work
Make it look like you're working

<b>hexSearch.sh</b> - Randomly outputs hexidecimal numbers and highlights
random numbers to make it simulate a search.


<b>fakeCompilation.sh</b> - Emulates gcc by pulling lines from /usr/include and
including them with a gcc flag.


<b>fakeBitbake.sh</b> - Simulates a bitbake build. It requires the three files:
fakeBitbake.sh, bitbake.sh, and bitbakeargs.txt. It works by outputting the
normal bitbake text and some fake warnings and looping through an array of
bitbake arguments. It then uses echo carriages to change the tasks that it is
"bitbaking" to simulate that is it building something.

Note: Must use "pkill bash" to end due to background processes. This may crash
other programs that are running bash. Use with caution!


<b>everything.sh</b> - Simply outputs everything from every file on your system.
Use with caution!


<b>trainNN.py</b> - Creates a neural network and trains it to solve the XOR
problem. The catch is that it outputs its training process every cycle for
a million cycles.

Note: Must have numpy python module installed.
