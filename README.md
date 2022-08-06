
# Simple Warehouse 
![ruby-3.1.2](https://img.shields.io/badge/Ruby-v3.1.2-green.svg)


### User Story

This is a simple command-line warehouse management tool. The user can record the storage and removal of crates of variable sizes on a grid of dynamic 'shelves'.


## Getting started
### Clone
To get started with the app, clone the repo
```
$ cd /path/to/repos
$ git clone 
$ cd simple_warehouse
```

### Running
This application is made using Ruby So first you need to install ruby version **3.1.2** to get started.

you can follow this tutorial for setting up ruby with rvm https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html

next install all the required gems via bundler
```
$ bundle install --without production
```
If the test suite passes, you'll be ready to run the app.

```
$ ruby runner.rb
```
## NOTES
### Functionalities
It accepts the following 7 commands:

| Command | Description |
| --- | --- |
| `help` | Shows the help message. |
| `init W H` | (Re)Initialises the application as an empty W x H warehouse. |
| `store X Y W H P` | Stores a crate of product code P and of size W x H at position (X,Y).<br>The crate will occupy W x H locations on the grid.|
| `locate P` | Show a list of all locations occupied by product code P. |
| `remove X Y` | Remove the entire crate occupying the location (X,Y). |
| `view` | Output a visual representation of the current state of the grid.<br>Position (1,1) should be at the bottom left position on the grid and (1, H) should be the top left. |
| `exit` | Exits the application. |

- Arguments W, H, X and Y will always be integers, and P will always be a single character. .

## Technical Design

When designing classes my primary drive was to stick to SOILD principles as
much as i can, by that in mind i have created below classes

### Classes
#### Crate

This class basically deal with the functionalities of the create or
what ever needs to be stored in the ware house. So in future if 
we need to change the storage type to something else ( for example triangle shaped boxes ),
we can build a triangle shaped class and by defining the same public 
methods we can simply do that with minimal changes

#### Warehouse
This basically deal with the functionalities of basic storage and retrieval of the objects 
if we define `touch?`, `collide?` ( other than attr_readers) we can implement any 
type of crate or behaviour we want. How each box should be stored is for the warehouse to 
decide. If there exists a warehouse which only allows red boxes we can simply add a validation
and the stored object doesnt need to be aware of that

#### WareHouseStdInAdapter

This connects the warehouse and and `stdin` so in future we can interface it with any
kind of I/O. if we need to use it with rails, we can write a simple adapter for that and the classes doesnt have to change
 
#### WarehouseLogger
This is just for abstracting away the presentation logic, if we want to do the present it some other way we can define a
class for that 

#### Visualizer::WindowView
This is basically a visualizer
> i couldn't get it to work a 100%, there are few issues with OPENGL

depending on out use case we can add different visualizers, if you want to show it
in the terminal instead of a window as always define another class to do that

### How can we improve

currently i am storing the boxes in an array, and that behaviour is hardcoded
in the warehouse class, this is not ideal. I would prefer moving the logic into 
storage classes, so if we want to store the data in Database, Redis, or disk
we can do that without any changes to the warehouse class
<br>

The visualizer is not perfectly working, i am having some issues with getting 
it to close after it has launched

> If you are having the same issue, just `ALT + TAB` to your terminal
> the program will continue to work and listen to yor input regardless


## Common Issues

1. If you are having issue getting the `ruby2d` installed and if you are in ubuntu please install these libraries
#### Ubuntu
```shell
sudo apt-get install libsdl2-dev \
    libsdl2-gfx-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-net-dev \
    libsdl2-ttf-dev \
    libreadline6-dev \
    libncurses5-dev
```


## TESTS
This project uses `rspec` as the testing library

to run the test run using this command

```
$ bundle exec rspec
```
