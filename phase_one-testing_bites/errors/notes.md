# Error notes

1. We use expect { ... } with curly braces, not parentheses.
2. We put the code that throws the error inside the braces. This, combined with difference 1, 'wraps' this code in a special environment that means RSpec can 'catch' the error.
3. We use raise_error instead of eq (equal).

Here's a good [stack overflow](https://stackoverflow.com/questions/21567838/when-to-use-curly-braces-vs-parenthesis-in-expect-rspec-method) post on why we use curly braces for expect rather than normal parentheses
Summary:     
When you pass a code block to expect, you are telling expect that you want it to examine the resulting behavior, the changes, made by your code block's execution, and then to let you know if it meets up to the expectations that you provide it.

When you pass an argument to expect, you are telling ruby to evaluate that argument to come to some value before expect even gets involved, and then you are passing that value to expect to see if it meets up to some expectation. But if there is an error then nothing is returned so we never get to the point of comparing anything to the expected value