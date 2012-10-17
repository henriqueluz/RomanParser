require "../src/empty_roman_number_exception.rb"

class InvalidRomanNumberException < Exception
end

class RomanParser
	

	def to_arabic(roman)
		@regex = /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
		
		raise EmptyRomanNumberException, 'Argument is empty' if roman.empty?
		raise InvalidRomanNumberException, 'Argument is invalid' if @regex.match(roman).nil?

		if(roman.size == 1)
			return char_to_num(roman)
		elsif(roman.size > 1)
			i = roman.size - 1
			total = 0
			roman.size.downto(1) do
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

describe RomanParser, "#to_arabic" do
	before(:each) do
		@parser = RomanParser.new
	end

	it "return exception when input is empty" do
		expect{@parser.to_arabic("")}.to raise_error(EmptyRomanNumberException, 'Argument is empty')
	end 

	it "return exception when input is invalid" do
		expect{@parser.to_arabic("F")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end 

	it "return 1 when input is I" do
		@parser.to_arabic("I").should eq 1
	end

	it "return 5 when input is V" do
		@parser.to_arabic("V").should eq 5
	end

	it "return 10 when input is X" do
		@parser.to_arabic("X").should eq 10
	end

	it "return 50 when input is L" do
		@parser.to_arabic("L").should eq 50
	end

	it "return 100 when input is C" do
		@parser.to_arabic("C").should eq 100
	end

	it "return 500 when input is D" do
		@parser.to_arabic("D").should eq 500
	end

	it "return 1000 when input is M" do
		@parser.to_arabic("M").should eq 1000
	end

	it "return 2 when input is II" do
		@parser.to_arabic("II").should eq 2
	end

	it "return 3 when input is III" do
		@parser.to_arabic("III").should eq 3
	end

	it "return 4 when input is IV" do
		@parser.to_arabic("IV").should eq 4
	end	

	it "return 9 when input is IX" do
		@parser.to_arabic("IX").should eq 9
	end

	it "return 40 when input is XL" do
		@parser.to_arabic("XL").should eq 40
	end

	it "return 90 when input is XC" do
		@parser.to_arabic("XC").should eq 90
	end	

	it "return 400 when input is CD" do
		@parser.to_arabic("CD").should eq 400
	end

	it "return 900 when input is CM" do
		@parser.to_arabic("CM").should eq 900
	end

	it "return 1954 when input is MCMLIV" do
		@parser.to_arabic("MCMLIV").should eq 1954
	end

	it "return 2006 when input is MMVI" do
		@parser.to_arabic("MMVI").should eq 2006
	end

	it "return 3999 when input is MMMCMXCIX" do
		@parser.to_arabic("MMMCMXCIX").should eq 3999
	end

	it "return exception when input is MMMM" do
		expect{@parser.to_arabic("MMMM")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end

	it "return exception when input is IL" do
		expect{@parser.to_arabic("IL")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end


end


