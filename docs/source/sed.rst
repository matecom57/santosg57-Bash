SED
===

https://www.grymoire.com/Unix/Sed.html

Last modified: Tue Jul 25 11:54:15 2023


Donations ensure I keep this web site up and running. Thank you!
I would appreciate it if you occasionally buy me a coffee or if you perfer, my Ko-fi page is here

My Venmo account is @Bruce-Barnett-31

Click here to donate via paypal, and Thank you for the support
PayPal - The safer, easier way to pay online! 
Check out my Sed Reference Chart (pdf)

Quick Links
As a convenience, and to make my site more mobile-friendly, I moved my quick links to a new page: Click Here

Table of Contents
Note - You can click on the table of contents sections to jump to that section.
And if you click on a section header, it returns you to the Table of Contents. Handy, eh?

The Awful Truth about sed
The essential command: s for substitution
The slash as a delimiter
Using & as the matched string
Using \1 to keep part of the pattern
Extended Regular Expressions
Sed Pattern Flags
/g - Global replacement
Is sed recursive?
/1, /2, etc. Specifying which occurrence
/p - print
Write to a file with /w filename
/I - Ignore Case
Combining substitution flags
Arguments and invocation of sed
Multiple commands with -e command
Filenames on the command line
sed -n: no printing
Using 'sed /pattern/'
Using 'sed -n /pattern/p' to duplicate the function of grep
sed -f scriptname
sed in shell scripts
Quoting multiple sed lines in the C shell
Quoting multiple sed lines in the Bourne shell
sed -V
sed -h
A sed interpreter script
Sed Comments
Passing arguments into a sed script
Using sed in a shell here-is document
Multiple commands and order of execution
Addresses and Ranges of Text
Restricting to a line number
Patterns
Ranges by line number
Ranges by patterns
Delete with d
Printing with p
Reversing the restriction with !
Relationships between d, p, and !
The q or quit command
Grouping with { and }
Operating in a pattern range except for the patterns
Writing a file with the 'w' command
Reading in a file with the 'r' command
The # Comment Command
Adding, Changing, Inserting new lines
Append a line with 'a'
Insert a line with 'i'
Change a line with 'c'
Leading tabs and spaces in a sed script
Adding more than one line
Adding lines and the pattern space
Address ranges and the above commands
Multi-Line Patterns
Print line number with =
Transform with y
Displaying control characters with a l
Working with Multiple Lines
Matching three lines with sed
Matching patterns that span multiple lines
Using newlines in sed scripts
The Hold Buffer
Exchange with x
Example of Context Grep
Hold with h or H
Keeping more than one line in the hold buffer
Get with g or G
Branch (Flow Control)
Testing with t
Debugging with l
An alternate way of adding comments
The poorly documented ;
Passing regular expressions as arguments
Inserting binary characters
GNU sed Command Line arguments
The -posix argument
The --version argument
The -h Help argument
The -l Line Length Argument
The -s Separate argument
The -i in-place argument
The --follow-symlinks argument
The -b Binary argument
The -r Extended Regular Expression argument
The -u Unbuffered argument
The -z Null Data argument
FreeBSD Extensions
-a or delayed open
The -I in-place argument
-E or Extended Regular Expressions
Using word boundaries
Command Summary
In Conclusion
More References
Introduction to Sed
How to use sed, a special editor for modifying files automatically. If you want to write a program to make changes 
in a file, sed is the tool to use.

There are a few programs that are the real workhorse in the UNIX toolbox. These programs are simple to use for 
simple applications, yet have a rich set of commands for performing complex actions. Don't let the complex potential 
of a program keep you from making use of the simpler aspects. I'll start with the simple concepts and introduce the 
advanced topics later on.
When I first wrote this (in 1994), most versions of sed did not allow you to place comments inside the script. Lines 
starting with the '#' characters are comments. Newer versions of sed may support comments at the end of the line as 
well.

One way to think of this is that the old, "classic" version was the basis of GNU, FreeBSD and Solaris versions of 
sed. And to help you understand what I had to work with, here is the sed(1) manual page from Sun/Oracle.

The Awful Truth about sed
Sed is the ultimate stream editor. If that sounds strange, picture a stream flowing through a pipe. Okay, you can't 
see a stream if it's inside a pipe. That's what I get for attempting a flowing analogy. You want literature, read 
James Joyce.

Anyhow, sed is a marvelous utility. Unfortunately, most people never learn its real power. The language is very 
simple, but the documentation is terrible. The Solaris on-line manual pages for sed are five pages long, and two of 
those pages describe the 34 different errors you can get. A program that spends as much space documenting the errors 
as it does documenting the language has a serious learning curve.

Do not fret! It is not your fault you don't understand sed. I will cover sed completely. But I will describe the 
features in the order that I learned them. I didn't learn everything at once. You don't need to either.

And remember, clicking on a section title brings you back to the Table Of Contents. Click on the entry in the Table 
of contents brings you back to that section! Try it now!

c02
---

https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux

The sed command, short for stream editor, performs editing operations on text coming from standard input or a file. 
sed edits line-by-line and in a non-interactive way.

This means that you make all of the editing decisions as you are calling the command, and sed executes the 
directions automatically. This may seem confusing or unintuitive, but it is a very powerful and fast way to 
transform text, especially as part of a script or automated workflow.

This tutorial will cover some basic operations and introduce you to the syntax required to operate this editor. You 
will almost certainly never replace your regular text editor with sed, but it will probably become a welcomed 
addition to your text editing toolbox.

Note: This tutorial uses the GNU version of sed found on Ubuntu and other Linux operating systems. If you’re using 
macOS, you’ll have the BSD version which has different options and arguments. You can install the GNU version of sed 
with Homebrew using brew install gnu-sed.

c03
--

https://thevaluable.dev/sed-cli-practical-guide-examples/

The sun is shining today; too bad, you’re stuck in the office of your beloved company, MegaCorpMoneyMaker. Your task 
is to delete specific lines across thousands of XML files; it’s the “API” of an external warehouse, and, as always, 
they screwed it up.

You begin to write a script using your favorite programming language, when suddenly Davina, your colleague 
developer, comes to your desk:

“You know that you don’t have to write a script to do that? You could simply use sed in your terminal.”

You used sed in the past, but only to substitute some words with others. How could Davina delete specific lines 
depending on their content? You don’t have time to think more: Davina is already on your keyboard.

“It’s super easy. I’ll show you!”

Curious to learn more, you let her explain what sed is all about. This article is the transcription of this magical 
day which changed the world.

More specifically, Davina explained the following:

What argument we can give to sed.
What’s a sed script.
How to write the input file in place.
How to use an address in a sed script to edit specific lines.
How to use the commands print and delete.
How to invert the address.
How to use more than one command in a sed script.
How to use the substitute command.
As the title suggest, we’ll focus on GNU sed in this article. If you don’t have it, I’d recommend you to install and 
use it. To know if you have GNU sed, simply run sed --version in your shell; if it doesn’t work, you don’t have it. 
If it does work, you’ll get the information you seek.

Also, if you prefer watching videos instead of reading, you’ll find two at the end of this article, recorded by your 
humble servant.

Last thing: you can download the companion file if you want to follow along and try by yourself the different 
commands. I’d recommend you to do so, to remember what we’ll see here, and be able to use sed in different contexts.

It’s time! Get your diving gear and let’s explore the intricate caves of our stream of text.

The Basics of sed
Let’s begin by the obvious: what on Earth does “sed” mean? This lovely name is for stream editor. It’s indeed an 
editor which follows this workflow:

Take a stream of text as input.
Select some specific lines.
Perform some operations on each line selected.
Output the resulting text.
The second and third steps are done thanks to a sed script. We’ll look at this concept later; first, let’s look at 
what arguments we can give to sed in our shell.


