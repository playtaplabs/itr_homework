# Intro to Rails: Lesson 4

Object Oriented Programming

## Before we start

### Agenda

* Quiz
* Homework Review
* Methods
* Object Oriented Programming

### Quiz

1. How do you access values within an Array?
2. How are Arrays and Hashes different?
3. What are some ways to execute the same code multiple times?

### Homework Review

Walkthrough `previous_homework_solution.md`

Any questions about Lesson 3 homework?

## Methods

### We've already used some!

* [`IO#puts`][io_puts] - Print an object to the screen.
* [`IO#gets`][io_gets] - Reads the next "line" from the I/O stream.
* [`Array#length`][array_length] - Returns the number of elements in an array.
* [`Fixnum#+`][fixnum_plus] - Performs addition.

[io_puts]: http://www.ruby-doc.org/core-1.9.3/IO.html#method-i-puts
[io_gets]: http://www.ruby-doc.org/core-1.9.3/IO.html#method-i-gets
[array_length]: http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-length
[fixnum_plus]: http://www.ruby-doc.org/core-1.9.3/Fixnum.html#method-i-2B

### Other methods

What other methods have we used? 

### Methods defined

A method is a named code block wrapped by `def` and `end` which you may
execute by name.

In other languages, methods may be known as "functions", "operations",
"procedures", "subroutines", etc.

Methods may or may not return a value in Ruby, the last expression value is
returned whether or not you use the `return` statement.

### Method example

```ruby
def whats_up
  ["Not much", "A lot", "The sky"].sample
end

puts say_whats_up
```

### Method parameters

Methods may define parameters which allow arguments to be passed.

Parameters are a value that the method expects.

Arguments are what actually get passed.

### Method parameters example

```ruby
def say_my_name(name)
  "Hey, #{name}"
end

say_my_name("Rick") #=> "Hey, Rick"

say_my_name "Stan" #=> "Hey, Stan"
```

### Default values for parameters

We can optionally define default values for any or all of our parameters.

```ruby
def say_my_name(name = "friend")
  "Hey, #{name}"
end

say_my_name("Joe") #=> "Hey, Joe"

say_my_name #=> "Hey, friend"
```

### Indefinite number of parameters

If we want to allow our method to be called with an indefinite number of
parameters, we precede the parameter name with an asterisk (`*`).

```ruby
def format_names(*names)
  names.join(", ")
end

format_names("Alex", "Will", "John") #=> "Alex, Will, John"
```

### Variable scope within methods

Methods cannot access variables defined outside of the method.

```ruby
name = "Biff"

def print_name
  print(name)
end

print_name #=> NameError: undefined local variable or method `name'...
```

Use parameters instead!

### Code Along: Methods

Open `coa_methods.rb` in your editor and follow along.

### Exercise: Methods

Open `ex_methods.rb` in your editor and complete on your own. Ask questions if
you're confused!

## Object Oriented Programming

### Objects defined

An object is an *instance* of a *class*.

What is a class?

### Classes defined

Classes are like blueprints for the attributes and behaviors of an object.

* Attributes: Instance variables
* Behavior: Instance methods

### Objects defined, again

An object is an *instance* of a *class*.

IRL: If you had blueprints for a house, the blueprints would be the *class* and
the house built is the *instance* or *object*.

### Interacting with objects

*Methods* are called on an object to interact with it.

This is also called "sending a message" to an object.

The dot operator (`.`) sends the message on the right to the object on the left.

### Interacting with objects example

```ruby
names = ["Sam", "Alan", "Gregor"]

names.push("Anze")

names.length
```

### Classes are objects

In Ruby, even classes are objects.

```ruby
Array.new

Hash.new
```

### Why is Object Oriented Programming useful?

Object Oriented Programming (OOP) provides:

* A modular way to structure code
* A logical way to reuse code
* A way to model real world concepts in code
* OOP is a *very popular* programming paradigm

Supported by: Ruby, Python, C++, Java, Javascript, PHP, and many more...

### What is an object in Ruby?

Almost **everything** is an object in Ruby

```ruby
puts "Steve".upcase

3.times do |counter|
  puts counter * 10
end
```

Above, `"Steve"`, `3`, `10`, and the value of `counter` are objects.

### Object exceptions

Some concepts, such as methods, are not "first-class objects". We'll learn more
about this later.

### Built in classes

Ruby comes with dozens of built in classes:

* [String][string]
* [Hash][hash]
* [Array][array]
* [File][file]
* [Many more](http://www.ruby-doc.org/core-1.9.3/)...

[string]: http://www.ruby-doc.org/core-1.9.3/String.html
[hash]: http://www.ruby-doc.org/core-1.9.3/Hash.html
[array]: http://www.ruby-doc.org/core-1.9.3/Array.html
[file]: http://www.ruby-doc.org/core-1.9.3/File.html

### The Time class

The built in Time class is used to display and format time information.

```ruby
time = Time.new #=> 2013-03-06 11:36:34 -0800

time.friday? #=> false

time.year #=> 2013
```

### The File class

The built in File class can read and write files on the computer.

* [`File.new`][file_new] - opens or creates the specified file.
* [`File#write`][file_write] - writes data to a file.
* [`File#close`][file_close] - closes the file object

[file_new]: http://www.ruby-doc.org/core-1.9.3/File.html#method-c-new
[file_write]: http://www.ruby-doc.org/core-1.9.3/IO.html#method-i-write
[file_close]: http://www.ruby-doc.org/core-1.9.3/IO.html#method-i-close

### Code Along: Built in classes

Open `coa_builtin_classes.rb` in your editor and follow along.

### Exercise: Methods

Open `ex_buildin_classes.rb` in your editor and complete on your own. Ask
questions if you're confused!
