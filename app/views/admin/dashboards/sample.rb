numbers = [1, 2, 3, 4, 5]
numbers.shift(2)
p numbers
a = [0, 1, 2, 3, 4]
p a.shift            #=> 0
p a                  #=> [1, 2, 3, 4]

p [].shift           #=> nil
p [].shift(1) 
