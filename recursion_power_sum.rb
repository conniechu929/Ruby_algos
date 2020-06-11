def powerSum(base, n, num = 1)
    count = 0
    if num**n == base
        return count + 1
    elsif num ** n > base
        return count + 0
    else
        return  (powerSum(base - num**n, n, num + 1) + powerSum(base, n, num + 1))
    end
end