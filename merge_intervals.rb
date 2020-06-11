# Given a collection of intervals, merge all overlapping intervals.

# Example 1:

# Input: [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
    result = []
    intervals.sort_by! {|interval| interval[0]}
    
    intervals.each do |interval|
        if result.empty? or result.last[1] < interval[0]
            result << interval
        else
            if interval[1] > result.last[1]
                result.last[1] = interval[1]
            end
        end
    end
    result
end