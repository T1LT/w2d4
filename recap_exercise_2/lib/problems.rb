# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num1, num2)
    max = [num1, num2].max
    min = [num1, num2].min
    return max if max % min == 0
    i = 2
    while true
        if (max * i) % min == 0
            return max * i
        end
        i += 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
class String
    def substrings(length = nil)
        res = Set.new
        if length != nil
            (0..(self.length - length)).each do |i|
                res << self[i...(i + length)]
            end
            return res
        end
    end
end

def most_frequent_bigram(str)
    bigrams = str.substrings(2)
    max = 0
    res = ""
    bigrams.each do |bigram|
        temp = str.scan(/#{bigram}/).length
        if temp > max
            max = temp
            res = bigram
        end
    end
    res
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each { |k, v| hash[v] = k }
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each do |el|
            if self.include? num - el
                count += 1
            end
        end
        count / 2
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end
