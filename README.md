# PHPMimirTestRunner
A script and support files for running JUnit 4 tests in programming quesions in MimirHQ

Mimir is an excellent tool for teaching computer science. However, their test case 
syntax leaves something to be desired if you've worked with XUnit. You don't have
access to the assertions that XUnit has, nor the ability to define functions for setUp() 
or tearDown() or any other custom function. It's a fairly severe limitation.  

For PHP in particular, this is exacerbated by the lack of custom testing support (per
their support folks). There isn't even a `php` executable in the docker image (Ubuntu 16.04).

This little repo solves that problem and lets you run any number of PHPUnit tests. There's
a provided PHP CLI executable and it's automatically included in the download (thanks to [@twhitney11](https://github.com/twhitney11)).

## How to use
1. Create a new "Code Question" in Mimir.
1. Create your solution code and starter code as usual.
1. For grading, click "Add Test Case"
1. On the grading screen, name your test case and assign the *full* points
for the problem
1. Select a "Custom Test Case" for the test case type.
1. Turn on "Allow partial credit"
1. Drag and drop any PHPUnit test cases or supplemental PHP files into the Files area
1. Paste the following test script into the Bash script area:  
```bash
# To use this script:
#   Add "Optional" files containing your test cases
#   (file names should match "^.*Test.php$" or "^.*_test.php$" regex) and
#   any other supplemental files you want to participate in the testing
#   You could also wget those file from a github source.

wget -q https://raw.githubusercontent.com/toddawhittaker/PHPMimirTestRunner/master/MimirTestRunner.sh
source ./MimirTestRunner.sh
```  
  
  Alternately, you could directly paste in the contents of `MimirTestRunner.sh` from the repo.


That's it. The `MimirTestRunner.sh` will grab the PHP and PHPUnit executables from this repo.
It will syntax check all the PHP files and run those that are test cases. The exit code from
the runner will tell Mimir what percent of the test cases pass.

If you want to provide debugging help to students, it's best to give them a message as 
the last parameter to all your calls to `assertXXXX`.

Happy unit testing!