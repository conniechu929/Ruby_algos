# A transaction is possibly invalid if:

# the amount exceeds $1000, or;
# if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
# Each transaction string transactions[i] consists of comma separated 
# values representing the name, time (in minutes), amount, and city of the transaction.

# Given a list of transactions, return a list of transactions that are possibly invalid.  
# You may return the answer in any order.

 

# Example 1:

# Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
# Output: ["alice,20,800,mtv","alice,50,100,beijing"]
# Explanation: The first transaction is invalid because the second 
# transaction occurs within a difference of 60 minutes, have the same name and is in a different city. 
# Similarly the second one is invalid too.

# @param {String[]} transactions
# @return {String[]}
def invalid_transactions(transactions)
    res = []
    
    transactions.each_with_index do |t1, i|
        name1, time1, price1, city1 = t1.split(',')
        if price1.to_i > 1000
            res << t1
            next
        end
        transactions.each_with_index do |t2, j|
            if i != j
                name2, time2, amount2, city2 = t2.split(',')
                if name1 == name2 and city1 != city2 and (time1.to_i - time2.to_i).abs <= 60
                    res << t1
                    break
                end
            end
        end
    end
    return res
end