class Node
    attr_reader :value

    def initialize(value, child=nil)
        @value = value
        @child = child    
    end
end

def nth_from_last(head, n)
    pointer_1, pointer_2 = head, head

    for i in (0..n-1)
        if pointer_2 == null
            return null
        end
        pointer_2 = pointer_2.child
    end

    while pointer_2 != null
        pointer_2 = pointer_2.child
        pointer_1 = pointer_1.child
    end
    return pointer_1
end