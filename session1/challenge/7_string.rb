# given a string, return the character after every letter "r"
# 
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
    check = false
    to_return = ""
    string.chars.each {|i|
        if check == true
            to_return << i
            check = false unless i == "r" || i == "R"
            next
        else
            check = true if i == "r" || i == "R"
        end
    }
    return to_return
end

puts pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr") 