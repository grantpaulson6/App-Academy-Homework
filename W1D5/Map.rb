class Map
    def initialize
        @map = Array.new {Array.new(2)}
    end

    def set(key,value)
        @map.push([key,value])
    end

    def get(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        @map.each {|pair| @map.delete(pair) if pair[0] == key}
    end

    def show
        map
    end

    def inspect
        "You cannot look here"
    end

end