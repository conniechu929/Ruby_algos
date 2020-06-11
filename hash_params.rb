class Hash
    def self.param_converter
        # adds and joins the values of the hash 
        self.map { |i| i * "=" } * "&"
    end
end

describe 'HTML Param Converter' do
    it 'Adds an HTML param converter to the Hash class' do
        hash = { :topic => 'baseball', :team => 'astros' }
        expect(hash.param_converter).to eq('topic=baseball&team=astros')
    end
end

hash = { :topic => 'baseball', :team => 'astros' }
hash.param_converter