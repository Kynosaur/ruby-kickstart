# Write a method, match_maker, which will receive an unknown number of
# elements, and return an array where every two elements are represented by true or false.
#
# The very first parameter will not be part of this set. Instead, it will tell
# you how to determine what their value should be.
# If it is true, then they will be true when they are oppositely truthy.
# If it is false, then they will be true when they are similarly truthy.
#
# Examples:
# match_maker false, true,  true                # => [true]
# match_maker true,  true,  true                # => [false]
# match_maker true,  false, false               # => [false]
# match_maker true,  false, true                # => [true]
# match_maker true,  true,  false               # => [true]
# match_maker true,  true,  true, false, true   # => [false, true]
# match_maker true,  true,  true, false, nil    # => [false, false]
# match_maker true,  true,  true, true, nil     # => [false, true]
# match_maker true,  true,  true, 0, nil        # => [false, true]

def match_maker(indicator, *args)
    evens = args.select.with_index{|i, idx| idx.even?}
    odds = args.select.with_index{|i, idx| idx.odd?}
    to_return = []
    if indicator == true
        for n in 0...evens.length
            if (evens[n] && odds[n]) || (!evens[n] && !odds[n])
                to_return << false
            else
                to_return << true
            end
        end
    else
        for n in 0...evens.length
            if (evens[n] && odds[n]) || (!evens[n] && !odds[n])
                to_return << true
            else
                to_return << false
            end
        end
    end
    p evens
    p odds
    p to_return
end