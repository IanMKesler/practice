def countdown &block
    timePassed = (Time.now.hour)%12;

    timePassed.times do
        block.call
    end
end

countdown do
    puts 'DONG!'
end