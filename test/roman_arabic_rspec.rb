require "../src/roman_arabic.rb"

describe RomanParser, "#to_arabic" do
	before(:each) do
		@parser = RomanParser.new
	end

	it "should throw exception when input is empty" do
		expect{@parser.to_arabic("")}.to raise_error(EmptyRomanNumberException, 'Argument is empty')
	end 

	it "should throw exception when input is invalid" do
		expect{@parser.to_arabic("F")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end 

	it "should return 1 when input is I" do
		@parser.to_arabic("I").should eq 1
	end

	it "should return 5 when input is V" do
		@parser.to_arabic("V").should eq 5
	end

	it "should return 10 when input is X" do
		@parser.to_arabic("X").should eq 10
	end

	it "should return 50 when input is L" do
		@parser.to_arabic("L").should eq 50
	end

	it "should return 100 when input is C" do
		@parser.to_arabic("C").should eq 100
	end

	it "should return 500 when input is D" do
		@parser.to_arabic("D").should eq 500
	end

	it "should return 1000 when input is M" do
		@parser.to_arabic("M").should eq 1000
	end

	it "should return 2 when input is II" do
		@parser.to_arabic("II").should eq 2
	end

	it "should return 3 when input is III" do
		@parser.to_arabic("III").should eq 3
	end

	it "should return 4 when input is IV" do
		@parser.to_arabic("IV").should eq 4
	end	

	it "should return 9 when input is IX" do
		@parser.to_arabic("IX").should eq 9
	end

	it "should return 40 when input is XL" do
		@parser.to_arabic("XL").should eq 40
	end

	it "should should return 90 when input is XC" do
		@parser.to_arabic("XC").should eq 90
	end	

	it "should return 400 when input is CD" do
		@parser.to_arabic("CD").should eq 400
	end

	it "should return 900 when input is CM" do
		@parser.to_arabic("CM").should eq 900
	end

	it "should return 1954 when input is MCMLIV" do
		@parser.to_arabic("MCMLIV").should eq 1954
	end

	it "should return 2006 when input is MMVI" do
		@parser.to_arabic("MMVI").should eq 2006
	end

	it "should return 3999 when input is MMMCMXCIX" do
		@parser.to_arabic("MMMCMXCIX").should eq 3999
	end

	it "should throw exception when input is MMMM" do
		expect{@parser.to_arabic("MMMM")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end

	it "should throw exception when input is IL" do
		expect{@parser.to_arabic("IL")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end

	it "should return 2012 when input is MMXII" do
		@parser.to_arabic("MMXII").should eql(2012)
	end

	it "should throw exception when input is 'MDDXVI'" do
		expect{@parser.to_arabic("MDDXVI")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end

	it "should throw exception when input is MIM" do
		expect{@parser.to_arabic("MIM")}.to raise_error(InvalidRomanNumberException, 'Argument is invalid')
	end
end