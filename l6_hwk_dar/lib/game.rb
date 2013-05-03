class Game
	include Comparable
	attr_accessor :guesses_allowed 
	attr_reader :secret_number :current_guess_count
	
win = "\nCongrats! It turns out you've won!!"
lose = "\nOuch! It turns out you've lost!!"
too_low = "\nSorry - that guess was too low"
too_high = "\nNot quite - too high"

keys = [:win , :lose , :too_low , :too_high]
@@messages = { :win => win, :lose => lose, :too_low => too_low, :too_high => too_high }


	def initialize(guesses_allowed , highest_number , lowest_number)
		@guesses_allowed = guesses_allowed
		@highest_number = highest_number
		@lowest_number = lowest_number

		@secret_number = (lowest_number..highest_number).to_a.sample

		@secret_number = SecretNumber.new(set_of_numbers)
		@current_guess_count = 0
		@current_guess = nil
		@player = Player.new()
		@jugar = nil
	end

	def print_created_by
		puts "\n\nHello, friend. This superb game was created by yours truly, Davin Riley"
	end

	def start_game
		puts "Bienvenidos!"
		print_created_by

		puts "\n ¿Como te llamas?"
		@player.name = $stdin.gets.chomp.capitalize

		puts "¡Hola, #{@player.name}! Tú tienes #{@guesses_allowed} suposiciónes del Numero Secreto entre #{@secret_number}"
	
		while @current_guess_count < @guesses_allowed && !guess_correct?(@current_guess) do 
			puts "Faltan #{@guesses_allowed} suposiciónes..."
			@current_guess = $stdin.gets.chomp.to_i

			game_records.write("\nGuess number #{@guesses_allowed} was #{@current_guess}")
			@current_guess_count += 1	
		end

	
	end

	def guess_correct?(guess)
		if guess.nil?
			puts "Whatsamattayou?!"
			return false
		while guesses_allowed > current_guess_count
			print "what is your guess"
			guess = gets.chomp

			if guess.to_i == secret_number
				puts @@messages[keys[0]]
				puts "You guessed within #{@current_guess_count} tries"
			return true
		elsif guess > @secret_number.secret_number
			puts @@messages[keys[3]]
			puts "You have #{@current_guess_count} guess(es) left"
			return false	
		elsif guess < @secret_number.secret_number
			puts @@messages[keys[2]]
			puts "You have #{@current_guess_count} guess(es) left"
			return false
		end
	end

	def guess!
		@current_guess_count+=1
	end

	def remaining_guesses
		guesses_allowed - current_guess_count
	end

end
