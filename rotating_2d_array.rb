# creating a new array
# n is the number of columns
def rotate(given_array, n)
    rotated = Array.new(given_array.length) {[0]*n}
    for i in (0..n-1)
        for j in (0..n-1)
            [new_i, new_j] = rotate_sub(i, j, n)
            rotated[new_i][new_j] = given_array[i][j]
        end
    end
    rotated
end

def rotate_sub(i, j, n)
    return [j, n - 1 - i]
end

# in-place solution
def in_place_rotation(given_array, n)
    for i in (0..(n/2).ceil - 1) do
        for j in (0..(n/2).floor - 1) do
            tmp = [-1, -1, -1, -1]
            current_i, current_j = i, j
            for k in (0..3) do
                tmp[k] = given_array[current_i][current_j]
                current_i, current_j = rotate_sub(current_i, current_j, n)[0], rotate_sub(current_i, current_j, n)[1]
            end
            for k in (0..3) do
                given_array[current_i][current_j] = tmp[(k+3) % 4]
                current_i, current_j = rotate_sub(current_i, current_j, n)[0], rotate_sub(current_i, current_j, n)[1]
            end
        end
    end
    given_array
end

