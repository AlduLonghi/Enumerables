require './main'

describe Enumerable do 
    let(:array) {[2, 3, 4, 6, 8]}
    let(:hash) { "a" => 2, "b" => 3, "c" => 4 }
    let(:range) {(1..10)} 
    let(:word_array) {%[a e r t y]}
    let(:mixt_array) {["a", 1, "b", 1]}
    let(:my_block) {Proc.new{|x| p x + x}}

    describe "#my_each"  do
        it "return the same as each method" do
            expect(array.my_each(&my_block)).to eql(array.each(&my_block))
        end

    end