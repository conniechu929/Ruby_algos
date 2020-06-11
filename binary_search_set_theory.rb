# Write a program to find the n-th ugly number.

# Ugly numbers are positive integers which are divisible by a or b or c.

 

# Example 1:

# Input: n = 3, a = 2, b = 3, c = 5
# Output: 4
# Explanation: The ugly numbers are 2, 3, 4, 5, 6, 8, 9, 10... The 3rd is 4.
# Example 2:

# Input: n = 4, a = 2, b = 3, c = 4
# Output: 6
# Explanation: The ugly numbers are 2, 3, 4, 6, 8, 9, 10, 12... The 4th is 6.
# Example 3:

# Input: n = 5, a = 2, b = 11, c = 13
# Output: 10
# Explanation: The ugly numbers are 2, 4, 6, 8, 10, 11, 12, 13... The 5th is 10.
# Example 4:

# Input: n = 1000000000, a = 2, b = 217983653, c = 336916467
# Output: 1999999984
 

# Constraints:

# 1 <= n, a, b, c <= 10^9
# 1 <= a * b * c <= 10^18
# It's guaranteed that the result will be in range [1, 2 * 10^9]

def nth_ugly_number(n, a, b, c)
#     a-b, a-c, b-c, ab-c
    ab_lcm = a.lcm(b) # there are some a present in b
    ac_lcm = a.lcm(c) # there are some a present in c
    bc_lcm = b.lcm(c) # there are some b present in c
    abc_lcm = ab_lcm.lcm(c) # there are some a*b in c (because c is the biggest)
    
    # using set theory for binary search
    # a + b + c - ab_lcm - ac_lcm - bc_lcm + abc_lcm
    (1..2*10**9).bsearch{|x| x/a + x/b + x/c - x/ab_lcm - x/ac_lcm - x/bc_lcm + x/abc_lcm >= n}
end