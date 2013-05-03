class SecretNumber
	attr_reader :set_of_numbers :secret_number

	def initialize(set_of_numbers)
		@set_of_numbers = set_of_numbers || (0..10)
		@secret_number = generate
	end

private
	def generate
		@secret_number = @set_of_numbers.to_a.sample.to_i
	end
end
