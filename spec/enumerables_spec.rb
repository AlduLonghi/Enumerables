require './main'

describe Enumerable do 
    let(:array) {[2, 3, 4, 6, 8]}
    let(:my_hash) { {"a" => 2, "b" => 3, "c" => 4} }
    let(:range) {(1..10)} 
    let(:my_string) {%[a e r t y]}
    let(:string_array) { ['a', 'b', 'c', 'd']}
    let(:mixt_array) {["a", 1, "b", 1]}
    let(:my_block) {Proc.new{|x| x + x}}
    let(:my_string_block) {Proc.new {|x| x.length }}
    let(:my_second_block) {Proc.new {|x, y| p x, y}}

    describe "#my_each"  do
        it "return same as each method (integer array)" do
            expect(array.my_each(&my_block)).to eql(array.each(&my_block))
        end

        it "return same as each method (hash)" do
            expect(my_hash.my_each(&my_block)).to eql(my_hash.each(&my_block))
        end

        it "return same as each method (range)" do
            expect(range.my_each(&my_block)).to eql(range.each(&my_block))
        end
      

        it "return same as each method (string array)" do
            expect(string_array.my_each(&my_block)).to eql(string_array.each(&my_block))
        end

        it "return same as each method (mixed array)" do
            expect(mixt_array.my_each(&my_block)).to eql(mixt_array.each(&my_block))
        end

        it "return enumerator when no block is passed" do
            expect(array.my_each).to be_a(Enumerator)
        end

        it "return same as each method (string)" do
            expect {my_string.my_each }.to raise_error
        end

    end

    describe "#my_each_with_index" do 
        it "return same as each_with_index  method (integer array)" do
            expect(array.my_each_with_index(&my_second_block)).to eql(array.each_with_index(&my_second_block))
        end
        it "return same as each_with_index  method (hash)" do
            expect(my_hash.my_each_with_index(&my_second_block)).to eql(my_hash.each_with_index(&my_second_block))
        end 
        it "return same as each_with_index  method (range)" do
            expect(range.my_each_with_index(&my_second_block)).to eql(range.each_with_index(&my_second_block))
        end 
        it "retuen same as each-with_index method (string)" do
            expect {my_string.my_each_with_index }.to raise_error
        end
    end
end