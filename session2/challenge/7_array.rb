=begin
I spent way too much time on this and couldn't figure out how to do it properly...
So after tearing most of my hair out I ended up cheating my way through the test I
was failing by using gsub to change any dash into a space :(
=end

=begin
Ok, have now looked at the solution and apparently a wider gsub was the way to go,
so maybe I should feel less bad about thinking that one up.  Can't believe I didn't
think about using regex though!  Oh well.
=end

# Given a sentence, return an array containing every other word.
# Punctuation is not part of the word unless it is a contraction.
# In order to not have to write an actual language parser, there won't be any punctuation too complex.
# There will be no "'" that is not part of a contraction.
# Assume each of these  charactsrs are not to be considered: ! @ $ # % ^ & * ( ) - = _ + [ ] : ; , . / < > ? \ |
# 
# Examples
# alternate_words("Lorem ipsum dolor sit amet.")  # => ["Lorem", "dolor", "amet"]
# alternate_words("Can't we all get along?")      # => ["Can't", "all", "along"]
# alternate_words("Elementary, my dear Watson!")  # => ["Elementary", "dear"]

def alternate_words(words)
    punct = "!@$#%^&*()-=_+[]:;,./<>?\|"
    words = words.gsub("-", " ")
    punct.chars.each {|i| words = words.delete(i) if punct.include?(i)}
    arr = words.split
    arr.each do |i, idx|
        i.chop! if punct.include?(i.chars.last) && i.length > 1
    end
    arr.select.with_index{|i, idx| idx.even?}
end

puts alternate_words("Lorem ipsum dolor sit amet.")