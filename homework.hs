-- > 2
n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]



length [ x | x <- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], x `mod` 3 == 0, x `mod` 5 == 0]

sum [ x | x <- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], x `mod` 3 == 0 || x `mod` 5 == 0]

--range
[2,4..20]
sum [1..10]

--euler 1
--If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
--Find the sum of all the multiples of 3 or 5 below 1000.
sum [ x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]
--233168