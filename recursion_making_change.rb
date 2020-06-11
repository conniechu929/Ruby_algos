coins = [1, 5, 10, 25]
num = 32
def change(num, coins, arr)
# what type of num/coin system?
# lets start with american coin system
    if num == 0
        return 0
    else
        min = num
        for coin in coins
            if num - coin >= 0
                count = 0
                if arr[num - coin] >= 0
                    count = arr[num-coin]
                else
                    count = change(num - coin, coins, arr)
                    arr[num-coin] = count
                end
                if min > count + 1
                    min = count + 1
                end
            end
        end
        return min
    end
end


def make_change(num, coins)
    arr = Array.new(num) {-1}
    return change(num, coins, arr)
end