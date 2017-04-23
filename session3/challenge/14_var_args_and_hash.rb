# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14(*args)
    if args.last.is_a?(Hash)
        prob = args.pop
        if prob[:problem] == :same_ends
            same_ends(*args)
        else
            count_clumps(*args)
        end
    else
        count_clumps(*args)
    end
end

def same_ends(n, *args)
    ary = args.to_a
    if n == 0
        ary[0] == ary[-1] ? true : false
    else
        ary[0...n] == ary[-n..-1] ? true : false
    end
end

def count_clumps(*args)
    ary = args.to_a
    last, in_clump, count = nil, false, 0
    ary.each do |i|
        if i == last
            in_clump = true
            last = i
        else
            count += 1 if in_clump == true
            in_clump = false
            last = i
        end
    end
    count += 1 if in_clump == true
    return count
end