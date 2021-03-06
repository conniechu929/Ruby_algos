# There are n flights, and they are labeled from 1 to n.

# We have a list of flight bookings.  The i-th booking bookings[i] = [i, j, k] 
# means that we booked k seats from flights labeled i to j inclusive.

# Return an array answer of length n, representing the number of seats 
# booked on each flight in order of their label.

# Example 1:

# Input: bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
# Output: [10,55,45,25,25]

# @param {Integer[][]} bookings
# @param {Integer} n
# @return {Integer[]}
def corp_flight_bookings(bookings, n)
    arr = Array.new(n+1) {0}
    
    for i in (0..bookings.length-1)
        start, ending, k = bookings[i]
        arr[start-1] += k
        arr[ending] -= k
    end
    for i in (1..n)
        arr[i] = arr[i] + arr[i-1]
    end
    return arr[0..n-1]
end