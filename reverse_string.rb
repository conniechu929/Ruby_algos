class String
    def alt_reverse
        new_str = ''
        str_length = self.length - 1
        str_length.downto(0) do |i|
            new_str << str[i]
        end
        new_str
    end

    def reverse_inplace
        # str.each_char.to_a.reverse.join
        half_length = self.length / 2
        half_length.times do |i|
            self[i], self[-i-1] = self[-i-1], self[i]
        end
        self
    end

end

describe 'Letter reversing' do
    it 'reverses the letters of a string without using the reverse method' do
        expect('Hi there'.alt_reverse).to eq('ereht iH')
    end
end
