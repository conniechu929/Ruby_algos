def step(n)
  result = 0
  while n > 0 do
    result += (n % 10) ** 2
    n = n // 10
  end
  return result
end

def happy_num(n)
  tortoise = step(n)
  hare = step(step(n))
  while tortoise != hare && hare != 1 do
    tortoise = step(tortoise)
    hare = step(step(hare))
  end
  return hare == 1
end