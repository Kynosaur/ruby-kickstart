# For this problem, you will need to know how to use a linked list.
#
# A linked list is like a train, each car is connected to the car behind it. Then you just
# keep track of the engine, and you know where the whole train is. And you know when you reach
# the caboose because it's not got any more cars behind it.
#
# We'll implement our linked list with hash tables. So in a linked list, you keep track of the
# first hash in the list, usually called the head, and he points to the node after him.
# Similarly, the node after him, and every other node in the list point to the node after
# themselves, as well. Except the last node, which points to nil.
#
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
# head                                # => {:data=>2, :next=>{:data=>1, :next=>nil}}
# head = {:data => 3, :next => head}
# head                                # => {:data=>3, :next=>{:data=>2, :next=>{:data=>1, :next=>nil}}}
#
# See? Each one just points to the next one after himself. Then you can say things like:
# head[:data]                 # => 3
# head[:next][:data]          # => 2
# head[:next][:next][:data]   # => 1
#
# ===========
#
# Now that we know what a linked list is, write a function named middle, which takes a linked list,
# and returns the data halfway down the list.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# middle head                        # => 1
# head = {:data => 2, :next => head}
# middle head                        # => 1
# head = {:data => 3, :next => head}
# middle head                        # => 2
# head = {:data => 4, :next => head}
# middle head                        # => 2
# head = {:data => 5, :next => head}
# middle head                        # => 3
# head = {:data => 6, :next => head}
# middle head                        # => 3




=begin

This is the cheaty way! Checks the number at the start of the list
and returns a result based on that without checking the actual length
of the list.  This passes all the rake tests.

def middle(head)
    head[:data].even? ? head[:data]/2 : head[:data]/2 + 1
end


This is my attempt at doing it recursively, spent a long time wondering why
count wasn't increasing before remembering how scope works with variables.
Ended up looking at the solution for this one (my frazzled brain didn't think
it would be acceptable to write a second method outside of the one requested!).

def middle(head)
    ary ||= []
    if head[:next] == nil
        count += 1
    else
        ary << head[:data]
        p ary
        middle(head[:next])
    end
    if ary.length.even? == true
        return ary[(ary.length/2)]
    else
        return ary[(ary.length/2)]
    end
end
=end


def list_size(list)
  return 0 unless list
  1 + list_size(list[:next])
end

def middle(list, distance=list_size(list)/2)
  return list[:data] if distance == 0
  middle list[:next], (distance - 1)
end

=begin
So, what list_size does is has a look at our linked list, and returns 0 if "list"
is nil.  Otherwise, it returns 1 plus the result of calling list_size with the value
of the :next key.  When it gets to the end of the list (nil) it returns 0, and we're left
with a value equal to the length of the linked list (this is what I was trying to do
within my recursive method)

middle has "distance" as an optional parameter, but uses list_size to set it to a default
value of half the length of the list.

If running through list_size has given us a final value of 0, then 0 gets returned.
Otherwise, it runs middle again with list[:next] (which gives us the next "train car" down the line)
and distance - 1, until distance is equal to 0.
=end