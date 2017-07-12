fac n = if n == 0 then 1 else n * fac (n-1)

fac 0 = 1
fac n = n * fac (n-1)

main = print (fac 42)