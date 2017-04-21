# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
    def initialize(bottles)
        bottles = 0 if bottles < 0
        bottles = 99 if bottles > 99
        @bottles = bottles
    end
    attr_accessor "bottles"
    
    def s_or_p
        if @bottles == 1
            return "bottle"
        else
            return "bottles"
        end
    end
    
    def english_number
        tens = ["zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
        rest = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        if @bottles > 19
            to_return = @bottles.to_s.chars.map{|n| n.to_i}
            if to_return[1] == 0
                "#{tens[to_return[0]]}".capitalize
            else
                "#{tens[to_return[0]]}-#{rest[to_return[1]]}".capitalize
            end
        else
            "#{rest[@bottles]}".capitalize
        end
    end
    
    def print_song
        while @bottles > 0
            puts "#{english_number} #{s_or_p} of beer on the wall,"
            puts "#{english_number} #{s_or_p} of beer,"
            puts "Take one down, pass it around,"
            @bottles -= 1
            puts "#{english_number} #{s_or_p} of beer on the wall."
        end
    end
    
end