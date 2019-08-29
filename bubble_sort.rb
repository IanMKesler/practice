def bubble_sort(array)
  upTo = array.length
  output = array
  while upTo > 1 do
    output.each_with_index{ |x, i|
        if i+1 < upTo
            order = sort([x, output[i + 1]], compare(x, output[i + 1]))
            output[i] = order[0]
            output[i+1] = order[1]
        end
    }
    upTo -= 1
  end
  output
end

def sort(array,value)
    array.reverse! if value == 1
    array
end

def compare(a,b)
    return 1 if a > b
    0
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
    upTo = array.length
    output = array
    while upTo > 1 do
    output.each_with_index{ |x, i|
        if i+1 < upTo
            order = yield(x,output[i+1])
            output[i],output[i+1] = output[i+1], output[i] if order > 0
        end
    }
    upTo -= 1
  end
  puts output
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end