# Debugging

### Methodical Debugging

#### Change Debugging:

You figure there is a problem in the code, and so you stare at the code looking for the most suspicious-seeming part of it. You change that part and run the code to see if it works. If it doesn't, you keep looking for new changes to make.           

The problem with this style is that there are approximately an infinite number of changes you can make to any complex code. The chances of you landing on the right fix are very small, especially if you are inexperienced.

#### Discovery Debugging:

You focus instead on investigating and examining how the code executes, the flow of control, which ifs and loops run and how many times, the values of variables as they change through the program. You build up your understanding of what the program is doing until you're quite sure you understand the problem.         

You discover the bug first, and only then do you apply a change to fix it. If your change is wrong, you go back to discovery mode.         

In Discovery Debugging, the code is an artefact to be studied.