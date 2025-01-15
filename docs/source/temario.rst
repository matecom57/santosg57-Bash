Bash Reference Manual
=====================

Reference Documentation for Bash
Edition 5.0, for Bash Version 5.0.
May 2019


Table of Contents

1 Introduction                  . 1

1.1 1.2 What is Bash?                         1

What is a shell?                        1

2 Definitions                   . 3

3 Basic Shell Features              . 5

3.1 Shell Syntax                          5

3.1.1 Shell Operation                      5

3.1.2 Quoting                         . 6

3.1.2.1 Escape Character                  . 6

3.1.2.2 Single Quotes                    . 6

3.1.2.3 Double Quotes                    6

3.1.2.4 ANSI-C Quoting                   6

3.1.2.5 Locale-Specific Translation              7

3.1.3 Comments                        . 7

3.2 Shell Commands                        8

3.2.1 Simple Commands                    . 8

3.2.2 Pipelines                         8

3.2.3 Lists of Commands                    9

3.2.4 Compound Commands                  . 9

3.2.4.1 Looping Constructs                 10

3.2.4.2 Conditional Constructs               11

3.2.4.3 Grouping Commands                15

3.2.5 Coprocesses                       15

3.2.6 GNU Parallel                      . 16

3.3 3.4 Shell Functions                        17

Shell Parameters                       20

3.4.1 Positional Parameters                  . 21

3.4.2 Special Parameters                   . 21

3.5 Shell Expansions                       22

3.5.1 Brace Expansion                     23

3.5.2 Tilde Expansion                     24

3.5.3 Shell Parameter Expansion               . 24

3.5.4 Command Substitution                 . 31

3.5.5 Arithmetic Expansion                  31

3.5.6 Process Substitution                   31

3.5.7 Word Splitting                     . 32

3.5.8 Filename Expansion                   32

3.5.8.1 Pattern Matching                  33

3.5.9 Quote Removal                     . 34

3.6 Redirections                         . 34

3.7 3.8 3.6.1 Redirecting Input                    . 35

3.6.2 Redirecting Output                   . 36

3.6.3 Appending Redirected Output              36

3.6.4 Redirecting Standard Output and Standard Error    . 36

3.6.5 Appending Standard Output and Standard Error    . 36

3.6.6 Here Documents                     37

3.6.7 Here Strings                       37

3.6.8 Duplicating File Descriptors               37

3.6.9 Moving File Descriptors                 38

3.6.10 Opening File Descriptors for Reading and Writing   . 38

Executing Commands                    . 38

3.7.1 Simple Command Expansion               38

3.7.2 Command Search and Execution             39

3.7.3 Command Execution Environment            39

3.7.4 Environment                      . 40

3.7.5 Exit Status                       . 41

3.7.6 Signals                         . 41

Shell Scripts                         . 42

4 Shell Builtin Commands           . 43

4.1 Bourne Shell Builtins                     43

4.2 Bash Builtin Commands                   . 50

4.3 Modifying Shell Behavior                   61

4.3.1 The Set Builtin                     . 61

4.3.2 The Shopt Builtin                    65

4.4 Special Builtins                        71

5 Shell 5.1 5.2 Variables                 73
Bourne Shell Variables                    . 73
Bash Variables                        73
6 Bash Features                 85
6.1 Invoking Bash                        . 85
6.2 Bash Startup Files                      87
6.3 Interactive Shells                       88
6.3.1 What is an Interactive Shell?              . 89
6.3.2 Is this Shell Interactive?                 89
6.3.3 Interactive Shell Behavior                . 89
6.4 6.5 6.6 6.7 6.8 Bash Conditional Expressions                 90
Shell Arithmetic                       . 92
Aliases                            93
Arrays                            94
The Directory Stack                     . 96
6.8.1 Directory Stack Builtins                 96
6.9 6.10 6.11 Controlling the Prompt                    97
The Restricted Shell                     99
Bash POSIX Mode                     . 99
iii
7 Job 7.1 7.2 7.3 Control                 . 104
Job Control Basics                     . 104
Job Control Builtins                     105
Job Control Variables                    107
8 Command Line Editing           . 108
8.1 Introduction to Line Editing                 108
8.2 Readline Interaction                     108
8.2.1 Readline Bare Essentials                . 109
8.2.2 Readline Movement Commands             109
8.2.3 Readline Killing Commands              . 110
8.2.4 Readline Arguments                  . 110
8.2.5 Searching for Commands in the History         110
8.3 Readline Init File                      . 111
8.3.1 Readline Init File Syntax                111
8.3.2 Conditional Init Constructs               119
8.3.3 Sample Init File                    . 121
8.4 Bindable Readline Commands                124
8.4.1 Commands For Moving                 124
8.4.2 Commands For Manipulating The History       . 125
8.4.3 Commands For Changing Text             . 126
8.4.4 Killing And Yanking                  . 128
8.4.5 Specifying Numeric Arguments             129
8.4.6 Letting Readline Type For You             129
8.4.7 Keyboard Macros                    131
8.4.8 Some Miscellaneous Commands             131
8.5 8.6 8.7 8.8 Readline vi Mode                      133
Programmable Completion                 . 134
Programmable Completion Builtins             . 136
A Programmable Completion Example            140
9 Using History Interactively         143
9.1 Bash History Facilities                    143
9.2 Bash History Builtins                    143
9.3 History Expansion                      145
9.3.1 Event Designators                   . 146
9.3.2 Word Designators                   . 146
9.3.3 Modifiers                        147
iv
10 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 Installing Bash               . 149
Basic Installation                      149
Compilers and Options                   150
Compiling For Multiple Architectures            150
Installation Names                     150
Specifying the System Type                . 151
Sharing Defaults                      151
Operation Controls                     151
Optional Features                     . 152
Appendix A Reporting Bugs         . 157
Appendix B Major Differences From
The Bourne Shell               158
B.1 Implementation Differences From The SVR4.2 Shell     162
Appendix C GNU Free Documentation License 164
Appendix D Indexes              172
D.1 Index of Shell Builtin Commands              172
D.2 Index of Shell Reserved Words               . 173
D.3 Parameter and Variable Index               . 174
D.4 Function Index                       176
D.5 Concept Index                       . 178

