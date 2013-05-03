###############################################################################
#
# Introduction to Ruby on Rails
#
# Lesson 5 homework
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# will help you to review more advanced topics on Object-Oriented
# Programming within the Ruby context based on what we've learned in
# Lesson 5.
#
###############################################################################
#
# 1. Review your solution to lesson 4 homework. Copy and Paste your solution to
#    this file.
#
# 2. Create a new folder called `lib` by running:
#
#    mkdir lib
#
# 3. Create a new file called `player.rb` with the class
#    `Player` defined within it in the `lib` directory.
#
#   1. In its initialize method, it should keep track of the Player's
#      name stored in the instance variable `@name`. When we create
#      a new Player, the initialize method should accept a parameter
#      that will be set for this instance variable.
#
#   2. Also, it should have an instance variable called
#      `@current_guess_count` which by default starts at 0.
#
#   3. Create a new method called `increment_guess_count` which increments
#      `@current_guess_count` by 1.
#
#   4. Make sure that the instance variable `@current_guess_count` can be
#      READ but not WRITTEN to.
#
#       Hint: Which `attr_` should you use at the top of your Class?
#
#   5. Make sure that the instance variable `@name` can be READ and
#      WRITTEN to.
#
#       Hint: Which `attr_` should you use at the top of your Class?
#
# 4. Create a new file called `secret_number.rb` with the class
#    `SecretNumber` defined within it in the `lib` directory.
#
#    1. The initialize method should accept a paramter of a range of
#       numbers that the Player must guess from and should be saved into
#       the instance variable `@set_of_numbers`. If not parameter is set,
#       it should default to (0..10).
#
#    2. In its initialize method, you should have an instance variable
#       called `@secret_number` which will hold the randomly generated
#       secret number that the Player must guess.
#
#    3. Make sure that the instance variables `@secret_number`,
#       `@guesses_allowed`, and @set_of_numbers may only be READ and
#       not WRITTEN to.
#
#    4. Create a new private class method called `generate_secret_number`,
#       set your instance variable `@secret_number` to call this method upon
#       initialization.
#
# 6. Create a new file called `game.rb` with the class `Game` defined
#    within it in the `lib` directory.
#
#    1. In its initialize method, it should keep track of how many
#       guesses are allowed to be made by the Player in the Integer instance
#       variable `@guesses_allowed`. When we create a new Game, the
#       initialize method should accept a parameter that will be set for
#       this instance variable. If no parameter is set, it should default
#       to `3`.
#
#    2. Additionally, it should accept as a parameter a range of
#       numbers that will be passed along to the `SecretNumber` class.
#
#    3. Also in its initialize method, it should keep track of how many
#       guesses have been currently made by the Player. Create the
#       Integer instance variable `@current_guess_count`. By default, set
#       this to `0`.
#
#    4. Your initialize method should also create the instance variables
#       `@player` and `@secret_number`. Set these variables
#       to create new instances of each of these classes. For the new
#       SecretNumber instance, pass along the set_of_numbers parameter.
#
#    5. Make sure that the instance variables `@guesses_allowed` and
#       `@current_guess_count` may only be READ and not WRITTEN to.
#
#    6. In your initialize method, create a new Integer instance
#       variable called `@current_guess` and set it to `nil` by default.
#       This will keep track of the Player's current guess.
#
#    6. Move the `increment_guess_count` method from your Player class
#       to the Game class. Instead of hard-coding the number of guesses
#       allowed as `3` use the new `@guesses_allowed` instance variable.
#
#    7. In your Game class, create the class variable `@@messages`. Move
#       your logic for creating your `messages` Hash from this file to the
#       Game class.
#
#    8. Create a new public instance method called `guess_correct?`
#       that accept the parameter `guess`. This will evalute whether or
#       not the Player's guess is correct. Use cases or conditionals to
#       see if the Player guessed correctly or guessed too high or too
#       low. Use the `@@messages` Hash to display which message to show to
#       the user. Also let the Player know how many guesses they have
#       left. If the guess is correct, make sure to return true,
#       otherwise return false.
#
#    7. Create a new public instance method in your Game class called
#       `print_created_by`. Move your logic from this file into this new
#       method so that when this method is called, your name will be
#       shown.
#
#    8. Create a new public instance method in your Game class called
#       `start_game`. In this method:
#
#       1. First call the method `print_created_by` so that your credit
#          is shown to the Player.
#
#       2. Next, ask the Player their name. Save this to @player.name.
#
#       3. Tell the Player how many guesses they get and the range of
#          numbers they can choose from.
#
#       4. Loop through however many `@guesses_allowed` are, running
#          increment_guess_count along the way. On each call, you should
#          ask the Player for their guess and use the `guess_correct?`
#          method. If at the end of the loop they still did not guess
#          correctly, tell the player that they have lost using the
#          `@@messages` class variable and what the secret number was.
#
# 7. In this file, load `player.rb`, `secret_number.rb`, and `game.rb`
#    along with their respective classes using `require_relative`.
#
# 8. For the most part, everything has been removed from this file and
#    placed in other classes. Now, when this Ruby script is run it
#    should:
#
#    1. Create a new instance of the class Game. Here when you
#       initialize the new Game, you can set how many guesses a Player
#       gets to guess the secret number and the range of numbers they
#       can select from.
#
#    2. Make sure to call the method `start_game` to get this
#       party started!
#
#    3. At the end, feel free to let your Player know, "Thanks for
#       Playing!"
#
# 9. Remember to keep your code clean and keep in mind how your file is
#    laid out. You want to make sure that the TAs reading your work will
#    understand your though process and give you good marks.
#
###############################################################################
#
# Student's Solution
#
###############################################################################

require_relative 'lib/player.rb'

guesses = 5

##### -- Incrementing the guess count by one?


def increment_guess_count(guess)
	incremented = guess.to_i + 1
end

##### -- How many guesses does the user have left?


def guesses_left(incremented)
	if incremented < 3
		puts 3 - incremented
	else
		puts "You have guessed at least 3 times"
	end
end


set_of_numbers = Array(1..50)
secret_num = set_of_numbers[rand(set_of_numbers.length)]

# puts "\n#{secret_num}"

win = "\nCongrats! It turns out you've won!!"
lose = "\nOuch! It turns out you've lost!!"
too_low = "\nSorry - that guess was too low"
too_high = "\nNot quite - too high"

keys = [:win , :lose , :too_low , :too_high]
messages = { :win => win, :lose => lose, :too_low => too_low, :too_high => too_high }

puts "\n\n\nHello, friend. Welcome to the NUMBER GUESSING GAME"


##### -- Let's ask for the players name.


puts "\nPlease tell me your name"
player_name = gets.chomp.capitalize


##### -- Let's ask the player if they'd like to begin the game


puts "\nThanks, #{player_name} - shall we begin? [Y/N]"
prompt = nil
game_records = File.new("mygame_records", "a+")

##### -- Let's make sure they are giving an appropriate response


while prompt != "y" && prompt != "n"
	prompt = gets.chomp.downcase

	break if prompt == "y"
	break if prompt == "n"

	puts "Please use Y or N"	
end

if prompt == "n"
	exit
else
	puts "\nLet's have some fun!"
	game_records.write("\nGame Start Time = ")
	game_records.write(Time.now)
end


##### -- The game begins


while guesses > 0
	puts "You have #{guesses} guess left"
	player_guess = gets.chomp.to_i

	game_records.write("\nGuess number #{guesses} was #{player_guess}")
	increment_guess_count(player_guess)

	if player_guess == secret_num
		puts messages[keys[0]]
		game_records.write("The player won by guessing #{player_guess}")
		exit
	elsif player_guess < secret_num
		puts messages[keys[2]]
		guesses -=1
	else
		puts messages[keys[3]]
		guesses -=1	
	end
	
end

puts messages[keys[1]]
game_records.write("\nThe secret number was #{secret_num}")
puts "The correct number was #{secret_num}"

