def sum_to(n)
    return 0 if n == 0
    return if n < 0
    n + sum_to(n-1)
end

puts sum_to(5)  # => returns 15
puts sum_to(1)  # => returns 1
puts sum_to(9)  # => returns 45
puts sum_to(-8)  # => returns nil

def add_numbers(nums_array)
    return if nums_array.length == 0
    return nums_array[0] if nums_array.length == 1
    nums_array[0] + add_numbers(nums_array[1..-1])
end

# puts add_numbers([1,2,3,4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80,34,7]) # => returns -39
# puts add_numbers([]) # => returns nil

def gamma_fnc(num)
    return if num <= 0
    return 1 if num == 1 || num == 2
    (num-1)*factorial(num-2)
end

def factorial(num)
    return 1 if num == 0
    num * factorial(num - 1)
end

# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040


def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..-1],favorite)
end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# puts ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0...-1])
end

# puts reverse("house") # => "esuoh"
# puts reverse("dog") # => "god"
# puts reverse("atom") # => "mota"
# puts reverse("q") # => "q"
# puts reverse("id") # => "di"
# puts reverse("") # => ""

