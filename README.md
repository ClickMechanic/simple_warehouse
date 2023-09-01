# Simple Warehouse
This is an exercise to create a simple command-line warehouse management tool. The user can record the storage and removal of crates of variable sizes on a grid of dynamic 'shelves'.

It should accept the following 7 commands:

| Command | Description |
| --- | --- |
| `help` | Shows the help message. |
| `init W H` | (Re)Initialises the application as an empty W x H warehouse. |
| `store X Y W H P` | Stores a crate of product code P and of size W x H at position (X,Y).<br>The crate will occupy W x H locations on the grid.|
| `locate P` | Show a list of all locations occupied by product code P. |
| `remove X Y` | Remove the entire crate occupying the location (X,Y). |
| `view` | Output a visual representation of the current state of the grid.<br>Position (1,1) should be at the bottom left position on the grid and (1, H) should be the top left. |
| `exit` | Exits the application. |

- Arguments W, H, X and Y will always be integers, and P will always be a single character.
- You do not need to worry about validating the format of the input.

![](./example.svg)

## Task
Your customer has provided some user stories (below) which describe their requirements.

Adapt the provided skeleton application to meet the user requirements.  Feel free to improve the existing code as you see fit.

We recommend writing unit tests for your code to ensure the correct functionality. We've included a few RSpec tests to get you started, but you can introduce an alternative testing framework if you want.

Please outline the reasoning behind your design decisions and any ways in which you think your code could be improved in [NOTES.md](./NOTES.md).

Please return an archive (`.zip` or `tar.gz`) of your local repository.


## User Stories
The following user stories describe the initial requirements for the tool;

----

### Warehouse manager can initialise and visualise a warehouse
**So that** I can represent my warehouse in the system  
**As a** warehouse manager  
**I want** to be able to initiate a warehouse  

Acceptance Criteria;
* I can call an `init` command, specifiying the size of the warehouse
* I can call a `view` command that will show a represention of the empty warehouse

----

### Warehouse manager can store crates of product in the warehouse
**So that** I can record the contents of my warehouse  
**As a** warehouse manager  
**I want** to be able to add a crate to my warehouse  

Acceptance Criteria;
* I can call a `store` command, specifying the size, position and content of a crate (product code is a single alpha character)
* I can call the `view` command and see a representation of the warehouse with the crate shown
* I am shown an error message when trying to store a crate that does not fit in the requested position 
* I am shown an error message if i reference a position that is not inside the warehouse

----

### Warehouse manager can find all the locations containing a crate
**So that** I can quickly find where a particular product is stored in the warehouse even if it is spread across multiple crates  
**As a** warehouse manager  
**I want** a command that will give me the relevant locations  

Acceptance Criteria;
* I can call a `locate` command specifying a product code
* I am shown a list of locations covered by *all* crates containing that product
* If a crate has dimensions 2 x 3, it will show 6 locations

----

### Warehouse manager can remove crates and reuse the freed up space
**So that** my records stay up-to-date when a crate is shipped from the warehouse  
**As a** warehouse manager  
**I want** to be able to record the removal of a crate in the warehouse  

Acceptance Criteria;
* I can call a `remove` command specifying any location in my warehouse
* The entire crate that covers that location will be removed
* I can reuse the freed-up space to `store` other crates
* I am shown a graceful error message if I try to remove a crate which doesn't exist.

----

## Example View
The exact format of the view command is up to you, here are a couple of possible examples, one simple and another slightly more advanced.

    > view
    .....BB.
    .....BB.
    .AAAABB.
    .AAAA...

    > view
      ---------------
    10               |
     9          BBBB |
     8          BBBB |
     7          BBBB |
     6          BBBB |
     5          BBBB |
     4  AAAAAAAABBBB |
     3  AAAAAAAABBBB |
     2  AAAAAAAABBBB |
     1  AAAAAAAA     |
      123456789111111
               012345


### Alternatives to Ruby
If you feel your skills are better demonstrated in a different language, please feel free to submit your solution in the language of your choice.  Be sure to include full instructions on how to build and run your code.


