def piglatin(word)
    return '' if word == ''

    first_letter = word[0].downcase
    result = ''
    if ['a', 'e', 'i', 'o', 'u'].include?(first_letter)
        result = word.concat('ay')
    else
        consonants = []
        consonants << word[0]

        for i in (1..word.length)
            if ['a', 'e', 'i', 'o', 'u'].include?(word[i]) == false
                consonants << word[i]
            elsif ['a', 'e', 'i', 'o', 'u'].include?(word[i]) == true
                break
            end
        end
        result = "#{word[consonants.length..-1] + consonants.join + 'ay'}"
    end
    result
end