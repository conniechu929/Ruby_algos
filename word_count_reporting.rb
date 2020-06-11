require 'rspec'

class String
    def total_words
        scan(/\w+/).count
    end

    def word_list
        downcase.scan(/\w+/).each_with_object(Hash.new(0)) {|item, hash| hash[item] += 1}
    end
end

str = '- the quick brown fox / jumped over the lazy fox'
# scan returns an array
str.scan(/\w+/)

describe 'Word Reporter' do
    before do
        @str = '- the quick brown fox / jumped over the lazy fox'
    end
    it 'counts words accurately' do
        expect(@str.total_words).to eq(9)
    end

    it 'returns a hash that totals up word usage' do
        expect(@str.word_list).to eq('the' => 2,
                                     'quick' => 1,
                                     'brown' => 1,
                                     'fox' => 1,
                                     'jumped' => 1,
                                     'over' => 1,
                                     'lazy' => 1)
    end
end
