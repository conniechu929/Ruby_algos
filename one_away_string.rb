# figure out if the two strings are one edit away from each other (add, delete, edit)

def one_away_string(str1, str2)
    return false if str1.length - str2.length > 1
    if str1.length == str2.length
        i = 0 
        diff = 0
        while i < str1.length
            if str1[i] != str2[i]
                diff += 1
            end
            i += 1
        end
        if diff > 1
            return false
        elsif diff == 1 || diff == 0
            return true
        end
    elsif (str1.length - str2.length).abs == 1
        i, j = 0, 0
        
        while i < str1.length and j < str2.length
            if str1[i] == str2[j]
                i += 1
                j += 1
            elsif str1.length > str2.length
                i += 1
                if str1[i] != str2[j]
                    return false
                else
                    i += 1
                    j += 1
                end
            else
                j += 1
                if str1[i] != str2[j]
                    return false
                else
                    i += 1
                    j += 1
                end
            end
        end
        true
    end
end