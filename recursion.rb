# base case/exit
# recursive call, i.e calling the function itself with different argument

# factorial number
def factorial(n)
  if n <= 1 # BASE CASE
    return 1
  end
  return n * factorial(n-1) # Recursive call
end

