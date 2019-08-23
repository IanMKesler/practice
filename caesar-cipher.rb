def caesar_cipher(string,n)
    alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    letters = string.downcase.split("")
    places = letters.map {|letter| 
        index = alphabet.index(letter)
        if index.nil?
            letter
        else
            (index+n)%26
        end
    }
    letters = places.map.with_index{ |place, index| 
        if place.instance_of?(String)
            place
        else
            string[index] =~ /[A-Z]/ ? alphabet[place].upcase : alphabet[place]
        end
    }
    
    letters.join
    
end
   

puts caesar_cipher("What a string!", 5)