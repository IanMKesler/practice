require_relative "../my_enumerable"

describe "my_each" do
    it "returns an enumerable if not passed a block" do
        expect([1,2,3].my_each).to be_a(Enumerable)
    end

    it "returns the original array" do 
        expect([1,2,3].my_each { |element| element}).to eql([1,2,3])
    end

    it "does the block on each member" do
        output = []
        [1,2,3].my_each { |element| output << element+1}
        expect(output).to eql([2,3,4])
    end

    it "handles hashes" do
        output = []
        {1 => "One", 2 => "Two", 3 => "Three"}.my_each { |pair| output << pair }
        expect(output).to eql([[1,"One"], [2,"Two"], [3, "Three"]])
    end
end

describe "my_each_with_index" do
    it "returns an enumerable if not passed a block" do
        expect([1,2,3].my_each_with_index).to be_a(Enumerable)
    end

    it "returns the original array" do 
        expect([1,2,3].my_each_with_index { |element, index| }).to eql([1,2,3])
    end

    it "does the block on each member" do
        output = []
        [1,2,3].my_each_with_index { |element, index| output << [element, index]}
        expect(output).to eql([[1,0], [2,1], [3,2]])
    end

    it "handles hashes" do
        output = []
        {1 => "One", 2 => "Two", 3 => "Three"}.my_each_with_index { |value, index| output << [value,index] }
        expect(output).to eql([[nil, 0], ["One",1], ["Two", 2]])
    end
end

describe "my_select" do
    it "returns an enumerable if not passed a block" do
        expect([1,2,3].my_select).to be_a(Enumerable)
    end

    it "returns filtered array" do 
        expect([1,2,3].my_select { |element| element > 2}).to eql([3])
    end

    it "handles hashes" do
        expect({1 => "one", 2 => "two"}.my_select { |pair| pair[0] == 2}).to eql([[2, "two"]])
    end
end