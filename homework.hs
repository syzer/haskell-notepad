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


-- TODO euler91 (tringles)
--a^2 + b^2 = c^2
--https://projecteuler.net/problem=91
--There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between 0 and 2 inclusive; that is,
--0 ≤ x1, y1, x2, y2 ≤ 2.

--Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?
let triangles = [(a,b,c) | c <- [1..100], b <- [1..100], a <- [1..10]]
let tianglesWithRightAngle = [(a,b,c) | c <- [1..50], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
-- [(3,4,5),(6,8,10)]
euler91 = length tianglesWithRightAngle
--2

distance = (x1 , y1) (x2 , y2) = sqrt (x * x + y * y)
    where
      x = x1 - x2
      y = y1 - y2

--distance (1, 1) (2, 2)