# ----------------------------------------------------------------------
# Card                | Prefix                                 | Length
# ----------------------------------------------------------------------
# American Express    | 34, 37                                 | 15
# Diners Club         | 36, 38                                 | 14, 15
# Visa                | 4                                      | 16
# Visa Electron       | 4026, 417500, 4508, 4844, 4913, 4917   | 16


def get_issuer(card_number)
  card_length = card_number.length
  prefix = card_number[0] + card_number[1]
  
  cards = {
    'American Express' => { :prefix => ['34', '37'], :length => [15]},
    'Diners Club' => { :prefix => ['36', '38'], :length => [14, 15] },
    'Visa' => { :prefix => ['4'], :length => [16]},
    'Visa Electron' => { :prefix => ['4026', '417500', '4508', '4844', '4913', '4917'], :length => [16] }
}
  
  cards.each do |key, value|
    if value[:prefix].include?(prefix) and value[:length].include?(card_length)
      return key      
    end
  end
  
  return 'Unknown'

end

require 'minitest/autorun'

class IssuerTest < Minitest::Test
  def test_issuer

    # assert_equal 'American Express', get_issuer('341235468923456')
    # assert_equal 'Diners Club', get_issuer('36123546892345')
    assert_equal 'Visa', get_issuer('4612354689234516')
    assert_equal 'Visa Electron', get_issuer('4026354689234516')
    assert_equal 'Unknown', get_issuer('123112354689234')
  end
end