# Test Driving a Single Method

Let's first look at what 'normal' non-test-driven programming looks like:

 **Freerunning Development**
 
 In this approach, you read the problem and think about it for a bit. Then you
 start writing code. You keep going and possibly running the code, seeing if
 you're getting closer to the solution and fixing your mistakes. Eventually
 your program does what you want.
 
 This can be very thrilling and motivating when it is going well!
 
 However, there is a problem: code gets complex. At some point it gets so
 complex that it won't fit in our brains any more. Then we start to feel
 overloaded and anxious. It can be very frustrating.

Freerunning Development is fine for small problems that stay small. However,
when problems get bigger we start to see the limits of this approach.

Test-driven development is another approach. Let's look at that:

 **Test-driven Development**  
 
 In this approach, you read the problem and think about it for a bit.
 
 Then you write a small example of how your code might be used in the form of a
 'test' or 'specification' ('spec'). You run the test and see that it fails
 with an error. This is called the 'red' phase.
 
 Then you write just enough of your program so that it can behave like the
 example (test) you wrote. Then you run the test again. If it still fails you
 fix it. Eventually you get it to pass. This is called the 'green' phase.
 
 After this, you improve the readability, structure, and other qualities of the
 code you wrote without changing its behaviour. This is called the 'refactor'
 stage.
 
 Then you write another small example, and continue in a cycle until your
 program is complete and you have a full set of examples to prove it.
 
 This approach is much more structured and, at times, it can even feel boring.
 However because it forces us to break down large problems into clearly
 specified and small examples that you focus on one by one, it helps our brains
 manage the complexity of a codebase by taking things 'one at a time'.

The above is a simplified approach. Over time you will add more techniques to
it.

Test-driven development is an approach to building software in the same way that
Karate is an approach to combat. It structures everything you do. At first it
will feel  strange and you will want to resume your unstructured approach.
However, it allows you to tackle much greater problems. 

In the same way the discipline of a martial artist enables them to use their
strength much more effectively, your discipline — both in test-driving and the
other three practices — enables you to use your brain much more effectively.

## Notes on TDD

When given a task, you may think You may immediately think "I know how to code that!". Resist that temptation and stick to the test-driving process.

1. Write a small example as a test.
2. Run the test (RED).
3. Write enough code to make that test pass.
4. Run the test (GREEN).
5. Refactor if necessary.
6. Return to step 1 and keep going until your program is complete.
