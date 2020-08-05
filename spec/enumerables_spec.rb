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
  let(:my_class_block) {proc {|x| x.is_a?(String) }}
  let(:my_inject_block) { proc {|x, y| x + y }}
  let(:my_inject_string_block) { proc {|memo, word| memo.length > word.length ? memo : word}}


  

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
      expect { my_string.my_each }.to raise_error(NoMethodError)
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
      expect { my_string.my_each_with_index }.to raise_error(NoMethodError)
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
      expect { my_string.my_select }.to raise_error(NoMethodError)
    end
  end

  describe '#my_all?' do
    it 'return same as all? method (integer array)' do
      expect(array.my_all?(&my_boolean_block)).to eql(array.all?(&my_boolean_block))
    end

    it 'return same as all? method (Range)' do
      expect(range.my_all?(&my_boolean_block)).to eql(range.all?(&my_boolean_block))
    end
    
    it 'return same as all? method (String)' do
      expect { my_string.my_all? }.to raise_error(NoMethodError)
    end
    
    it 'return same as all? method (String_array)' do
      expect(string_array.my_all?(&my_hash_block)).to eql(string_array.all?(&my_hash_block))
    end
       
    it 'return same as all? method (no_block_pass)' do
      expect(array.my_all?).to eql(true)
    end

    it 'return same as all? method (hash)' do
      expect(my_hash.my_all?(&my_hash_block)).to eql(my_hash.all?(&my_hash_block))
    end
  end
   
  describe '#my_any?' do
    it 'return same as any? method (integer array)' do
      expect(array.my_any?(&my_boolean_block)).to eql(array.any?(&my_boolean_block))
    end

    it 'return same as any? method (Range)' do
      expect(range.my_any?(&my_boolean_block)).to eql(range.any?(&my_boolean_block))
    end
    
    it 'return same as any? method (String)' do
      expect { my_string.my_any? }.to raise_error(NoMethodError)
    end
    
    it 'return same as any? method (String_array)' do
      expect(string_array.my_any?(&my_hash_block)).to eql(string_array.any?(&my_hash_block))
    end
       
    it 'return same as any? method (no_block_pass)' do
      expect(array.my_any?).to eql(true)
    end

    it 'return same as any? method (hash)' do
      expect(my_hash.my_any?(&my_hash_block)).to eql(my_hash.any?(&my_hash_block))
    end
  end

  describe '#my_none?' do
    it 'return same as none? method (integer array)' do
      expect(array.my_none?(&my_boolean_block)).to eql(array.none?(&my_boolean_block))
    end

    it 'return same as none? method (Range)' do
      expect(range.my_none?(&my_boolean_block)).to eql(range.none?(&my_boolean_block))
    end

    it 'return same as none? method (String)' do
      expect { my_string.my_none? }.to raise_error(NoMethodError)
    end

    it 'return same as none? method (String_array)' do
      expect(string_array.my_none?(&my_hash_block)).to eql(string_array.none?(&my_hash_block))
    end

    it 'return same as none? method (no_block_pass)' do
      expect(array.my_none?).to eql(false)
    end

    it 'return same as none? method (hash)' do
      expect(my_hash.my_none?(&my_hash_block)).to eql(my_hash.none?(&my_hash_block))
    end
  end 

  describe '#my_count' do
  it 'return same as count method (integer array, block given)' do
    expect(array.my_count(&my_boolean_block)).to eql(array.count(&my_boolean_block))
  end

  it 'return same as count method (integer array, argument given)' do
    expect(array.my_count(2)).to eql(array.count(2))
  end

  it 'return same as count method (integer array, argument given)' do
    expect(array.my_count(2, &my_boolean_block)).to eql(array.count(2, &my_boolean_block))
  end

  it 'return same as count method (integer array)' do
    expect(array.my_count).to eql(array.count)
  end

  it 'return same as count method (String)' do
    expect { my_string.my_count }.to raise_error(NoMethodError)
  end

  it 'return same as count method (Range)' do
    expect(range.my_count(&my_boolean_block)).to eql(range.count(&my_boolean_block))
  end

  it 'return same as count method (hash)' do
    expect(my_hash.my_count(&my_hash_block)).to eql(my_hash.count(&my_hash_block))
  end
end

  describe '#my_map' do
  it 'return same as map method (array)' do
    expect(array.my_map(&my_sum_block)).to eql(array.map(&my_sum_block))
  end

  it 'return same as map method (hash)' do
    expect(my_hash.my_map(&my_sum_block)).to eql(my_hash.map(&my_sum_block))
  end

  it 'return same as map method (range)' do
    expect(range.my_map(&my_sum_block)).to eql(range.map(&my_sum_block))
  end

  it 'return enumerator when no block is passed' do
    expect(array.my_map).to be_a(Enumerator)
  end

  it 'return same as map method (string)' do
    expect { my_string.my_map }.to raise_error(NoMethodError)
  end
end

describe '#my_inject' do
  it 'return the same as inject method (block given)' do
    expect(range.my_inject(&my_inject_block)).to eql(range.inject(&my_inject_block))
  end

  it 'return the same as inject method (symbol as argument)' do
    expect(range.my_inject(:+)).to eql(range.inject(:+))
  end

  it 'return the same as inject method (integer as argument and block given)' do
    expect(range.my_inject(2, &my_inject_block)).to eql(range.inject(2, &my_inject_block))
  end

  it 'return the same as inject method (string array)' do 
    expect(string_array.my_inject(&my_inject_string_block)).to eql(string_array.inject(&my_inject_string_block))
  end

  it 'return the same as inject method (String)' do
    expect { my_string.my_inject }.to raise_error(NoMethodError)
  end
end
end
