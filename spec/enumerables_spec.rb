require './main'

describe Enumerable do
  let(:array) { [2, 3, 4, 6, 8] }
  let(:my_hash) { { 'a' => 2, 'b' => 3, 'c' => 4 } }
  let(:range) { (1..10) }
  let(:my_string) { %(a e r t y) }
  let(:string_array) { %w[a b c d] }
  let(:mixt_array) { ['a', 1, 'b', 1] }
  let(:my_sum_block) { proc { |x| x + x } }
  let(:my_string_block) { proc { |x| x.length } }
  let(:my_puts_block) { proc { |x, y| p x, y } }
  let(:my_boolean_block) { proc {|x| x < 5} }
  let(:my_hash_block) { proc {|x, y| x < 'c'}}

  describe '#my_each' do
    it 'return same as each method (array)' do
      expect(array.my_each(&my_sum_block)).to eql(array.each(&my_sum_block))
    end

    it 'return same as each method (hash)' do
      expect(my_hash.my_each(&my_sum_block)).to eql(my_hash.each(&my_sum_block))
    end

    it 'return same as each method (range)' do
      expect(range.my_each(&my_sum_block)).to eql(range.each(&my_sum_block))
    end

    it 'return enumerator when no block is passed' do
      expect(array.my_each).to be_a(Enumerator)
    end

    it 'return same as each method (string)' do
      expect { my_string.my_each }.to raise_error
    end
  end

  describe '#my_each_with_index' do
    it 'return same as each_with_index  method (array)' do
      expect(array.my_each_with_index(&my_puts_block)).to eql(array.each_with_index(&my_puts_block))
    end

    it 'return same as each_with_index  method (hash)' do
      expect(my_hash.my_each_with_index(&my_puts_block)).to eql(my_hash.each_with_index(&my_puts_block))
    end

    it 'return same as each_with_index  method (range)' do
      expect(range.my_each_with_index(&my_puts_block)).to eql(range.each_with_index(&my_puts_block))
    end

    it 'return enumerator when no block is passed' do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end

    it 'return same as each-with_index method (string)' do
      expect { my_string.my_each_with_index }.to raise_error
    end
  end

  describe '#my_select' do
    it 'return same as select method (array)' do
      expect(array.my_select(&my_boolean_block)).to eql(array.select(&my_boolean_block))
    end

    it 'return same as select method (Range)' do
      expect(range.my_select(&my_boolean_block)).to eql(range.select(&my_boolean_block))
    end

    it 'return enumerator when no block is passed' do
      expect(array.my_select).to be_a(Enumerator)
    end

    it 'return same as select method (string)' do
      expect { my_string.my_each_with_index }.to raise_error
    end

  end
end
