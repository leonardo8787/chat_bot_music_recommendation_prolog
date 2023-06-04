# chat_bot_music_recommendation_prolog
Chat for music recommendation with prolog language.

## What is PROLOG ?

Prolog is a programming language based on logic and declarative programming. It stands for "Programming in Logic" and is commonly used in the field of artificial intelligence and computational linguistics. Prolog programs consist of a set of facts and rules, and the language allows you to make queries and perform logical inference on these facts and rules.

In Prolog, you define a knowledge base using predicates, which are statements about relationships between objects. Predicates are defined using rules and facts. A rule has a head and a body, separated by the ":-" symbol. The head represents a goal or a query, while the body contains the conditions that need to be satisfied for the goal to be true.

Here's a simple example to illustrate Prolog:

~~~
% Facts
likes(john, pizza).
likes(jane, sushi).
likes(bob, pizza).

% Rule
friend(X, Y) :- likes(X, Z), likes(Y, Z).

% Query
?- friend(john, bob).
~~~

In this example, we have defined three facts that state who likes what. We also have a rule that defines a "friend" relationship based on shared likes. The query "?- friend(john, bob)." asks if John and Bob are friends, and Prolog will try to find a combination of likes that satisfies the rule.

Prolog uses a process called backtracking to find solutions. It will explore different paths until it finds a solution or exhausts all possibilities. Prolog can be used for various applications, including natural language processing, expert systems, and constraint programming.

Keep in mind that this is just a brief introduction to Prolog. The language has many more features and capabilities, such as handling lists, recursion, and working with complex data structures. Exploring Prolog further will give you a better understanding of its power and versatility.

## Us chat

## Observations

## Autors

Leonardo Campos
Pedro Henrique
