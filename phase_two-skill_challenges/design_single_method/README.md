 # Single-Method Programs Design Recipe
 
 ## 1. Describe the Problem
 
 Typically you will be given a short statement that does this called a user
 story. In industry, you may also need to ask further questions to clarify
 aspects of the problem.
 
 ## 2. Design the Method Signature

 The signature of a method includes:
 
 * The name of the method.
 * What parameters it takes, their names and data types.
 * What it returns and the data type of that value.
 * Any other side effects it might have.
 
 Steps 3 and 4 then operate as a cycle.
 
 ## 3. Create Examples as Tests
 
 These are examples of the method being called with particular arguments, and
 what the method should return in each situation.
 
 For complex challenges you might want to come up with a list of examples first
 and then test-drive them one by one. For simpler ones you might just dive
 straight into writing a test for the first example you want to address.

 ## 4. Implement the Behaviour
 
 For each example you create as a test, implement the behaviour that allows the
 method to return the right value for the given arguments.
 
 Then return to step 3 until you have addressed the problem you were given. You
 may also need to revise your design, for example if you realise you made a
 mistake earlier.