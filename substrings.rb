def substrings(string, dictionary)
    alpha = /[A-Za-z]/
    substrings = {}
    search = string.split(" ")
    search.each { |word|
        dictionary.each { |substring|
            if word.include? substring
                substrings[substring].nil? ? substrings[substring]=1 : substrings[substring] += 1
            end
        }

    }
    puts substrings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)