
# Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

# You may assume that the intervals were initially sorted according to their start times.
# Example 1:

# Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
# Output: [[1,5],[6,9]]

# Example 2:

# Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
# Output: [[1,2],[3,10],[12,16]]
# Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

def insert(intervals, new_interval)
    result = []
    inserted = false
    
    intervals.each do |interval|
        if inserted
            result << interval
        elsif interval[1] < new_interval[0]
            result << interval
        elsif interval[0] > new_interval[1]
            result << new_interval
            result << interval
            inserted = true
        else
            new_interval[0] = [interval[0], new_interval[0]].min
            new_interval[1] = [interval[1], new_interval[1]].max
        end
    end
    
    if !inserted
        result << new_interval
    end
    result
end