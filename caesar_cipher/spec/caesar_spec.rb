require_relative "../caesar-cipher"

describe "caesar_cipher function" do
    it "returns an empty string" do
        expect(caesar_cipher("",5)).to eql("")
    end

    it "returns a shifted word" do
        expect(caesar_cipher("Murgle",2)).to eql("Owting")
    end

    it "returns a shifted sentence" do
        expect(caesar_cipher("Hi there!",3)).to eql("Kl wkhuh!")
    end

    it "returns a negatively shifted word" do 
        expect(caesar_cipher("Barn",-2)).to eql("Zypl")
    end

    it "returns a shifted word with huge shift number" do
        expect(caesar_cipher("Murlge",28)).to eql("Owtnig")
    end

    it "returns false if not passed a string" do
        expect(caesar_cipher(19,28)).to eql(false)
    end
end