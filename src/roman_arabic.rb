require "../src/empty_roman_number_exception.rb"
require "../src/invalid_roman_number_exception.rb"

class RomanParser
	@@regex = /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/

	def to_arabic(roman)
		
		raise EmptyRomanNumberException, 'Argument is empty' if roman.empty?
		raise InvalidRomanNumberException, 'Argument is invalid' if @@regex.match(roman).nil?

		if(roman.size == 1)
			return char_to_num(roman)
		elsif(roman.size > 1)
			i = roman.size - 1
			total = 0
			input_size = roman.size
			input_size.downto(1) do
				total = total + char_to_num(roman[i])
				if(i < roman.size-1) 
					if(char_to_num(roman[i]) < char_to_num(roman[i+1]))
						total = total - 2*char_to_num(roman[i])
					end
				end
				i = i-1
			end
			return total
		end
	end

	private
	def char_to_num(char)
		case char
			when "I"
				return 1
			when "V"
				return 5
			when "X"
				return 10
			when "L"
				return 50
			when "C"
				return 100
			when "D"
				return 500
			when "M"
				return 1000
		end
	end
end