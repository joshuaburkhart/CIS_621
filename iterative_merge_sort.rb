#!/usr/local/bin/ruby

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
    midpoint = old_midpoint  / 2
    while(result[0].length < original.length)
        (0..midpoint).each { |i|
            if(midpoint + i + 1 <= old_midpoint)
                j = midpoint + i + 1
                b = result[j]
                result[i] = merge(result[i],b)
            end
        }
        old_midpoint = midpoint
        midpoint = old_midpoint / 2
    end
    return result[0]
end

puts sort(input.split(//))
