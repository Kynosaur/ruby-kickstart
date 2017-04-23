# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]


# Should be obvious by comparing with solution but I didn't manage this one
# by myself.  After looking at the solution to get a general picture and then
# taking an hour away from it I *almost* managed to write a working one,
# but had to check it against the solution in the end and found the only errors
# were a height check instead of a width check in one place, and a 
# missing pair of parentheses on another line - so not too bad!


def spiral_access(ary, iteration=0, &block)
    max_width = ary.length-1
    max_height = ary.first.length-1
    
    return if max_width/2 < iteration || max_height/2 < iteration
    
    iteration.upto(max_width-iteration) do |n|
        block.call(ary[iteration][n])
    end
    
    (iteration+1).upto(max_height-iteration) do |n|
        block.call(ary[n][max_width-iteration])
    end
    
    (max_width-1-iteration).downto(iteration) do |n|
        block.call(ary[max_height-iteration][n])
    end
    
    (max_height-1-iteration).downto(iteration+1) do |n|
        block.call(ary[n][iteration])
    end
    
    spiral_access(ary, iteration+1, &block)
end