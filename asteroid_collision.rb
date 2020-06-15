# We are given an array asteroids of integers representing asteroids in a row.

# For each asteroid, the absolute value represents its size, and 
# the sign represents its direction (positive meaning right, negative meaning left). 
# Each asteroid moves at the same speed.

# Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. 
# If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

# Example 1:
# Input: 
# asteroids = [5, 10, -5]
# Output: [5, 10]
# Explanation: 
# The 10 and -5 collide resulting in 10.  The 5 and 10 never collide.

# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
    res = []
   
    for a in asteroids
        if a > 0
            res << a
        else
            while !res.empty? and (res[-1]>0) and (res[-1] + a < 0)
                res.pop
            end
            if res.empty? or res[-1] < 0
                res << a
            elsif res[-1] + a == 0 
                res.pop
            end  
        end  
    end
    res
end