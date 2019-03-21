

input = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def noms(arr)
    ans = ""
    arr.each do |fish1|
        arr.each do |fish2|
            ans = fish1.length > fish2.length ? fish1 : fish2
        end
    end
    ans
end

def quicker_noms(arr)

end

def quickest_noms(arr)
    arr.reduce { |fish1, fish2| fish1.length > fish2.length ? fish1 : fish2 }
end

#p quickest_noms(input)


def slow_dance(dir)

    directions = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

    directions.each_with_index { |d, i| return i if d == dir }
    nil
end

def fast_dance(dir)

    directions = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" =>5, "left" => 6,  "left-up" => 7}

    directions[dir]
end

p slow_dance("up")