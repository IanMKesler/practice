def log blockDescription, &block
    puts "\t"*$nestDepth + 'Starting ' + blockDescription + '...'

    $nestDepth += 1


    ouput = block.call

    $nestDepth -= 1

    puts "\t"*$nestDepth +blockDescription + ' finished, returning: ' + ouput.to_s

    
end

$nestDepth = 0

log 'outer block' do
    log 'inner block' do
        'boo'
    end

    5
end