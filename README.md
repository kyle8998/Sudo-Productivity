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
