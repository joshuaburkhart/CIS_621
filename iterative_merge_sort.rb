#!/usr/local/bin/ruby

#Usage: ./iterative_merge_sort.rb <unordered string>

#Example: ./iterative_merge_sort.rb czbyxa

input = ARGV[0]

def merge(a,b)
    result = ""
    i = 0
    j = 0
    while(!a.nil? && !b.nil? && i < a.length && j < b.length)
        head_a = a.slice(i,1)
        head_b = b.slice(j,1)
        first = ""
        if(head_a < head_b)
            first = head_a
            i+=1
        else
            first = head_b
            j+=1
        end
        result = "#{result}#{first}"
    end
    rem = ""
    if(!a.nil? && i < a.length)
        rem = a.slice(i..a.length)
    elsif(!b.nil? && j < b.length)
        rem = b.slice(j..b.length)
    end
    return "#{result}#{rem}"
end

def sort(original)
    result = original.clone
    old_midpoint = result.size
    while(result[0].length < original.length)
        midpoint = old_midpoint / 2
        (0..midpoint).each { |i|
            j = midpoint + i + 1
            if(j <= old_midpoint)
                result[i] = merge(result[i],result[j])
            end
        }
        old_midpoint = midpoint
    end
    return result[0]
end

puts sort(input.split(//))
