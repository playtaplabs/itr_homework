require_relative 'lib/player.rb'
require_relative 'lib/secret_number.rb'
require_relative 'lib/game.rb'

def ask_for(number_question)
	begin
		print "#{number_question}?"
		Integer(gets.chomp)
	rescue ArgumentError
		puts "Please enter an Integer"
		retry
	end
end


puts "This is my game"

highest_number = ask_for("what is the highest_number")
lowest_number = ask_for("what is the lowest_number")

puts "You will have to guess a number between #{lowest_number} and #{highest_number}!"

max_guesses = ask_for("How many guesses")

loop do 
	game = Game.new(max_guesses, highest_number, lowest_number)
	game.start_game

	puts "Would you like to play again? Y/N"
	if gets.chomp == "Y"
		next
	else
		break
	end
end


puts "¿Quieres jugar de nuevo?...'si' o 'no'"

@jugar = gets.chomp.downcase
jugar_de_nuevo?(@jugar)


def  jugar_de_nuevo?(jugar)
	while @jugar != "si" && @jugar != "no"
		puts "¿Que?"
	end

	if @jugar == "si"
		game = Game.new(3, (0..20))
		game.start_game
	elsif exit
	end
end

puts "Gracias por venir"