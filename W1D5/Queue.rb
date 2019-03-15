class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.push(el)
    end

    def dequeue
        queue.shift
    end

    def peek
        queue[0]
    end

    private
    attr_accessor :queue
end