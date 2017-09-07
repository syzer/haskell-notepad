module CourseWork2 where

-- conditionals
abs2 :: Int -> Int
abs2 n = if n>= 0 then n else -n

main = print $ abs2 5

-- :load edx-course/CourseWork2.hs
-- abs2 (-10)
-- 10


-- garded euations (instead ifs)
-- like cond in lisp

abs3 n | n >= 0    = n
       | otherwise = -n

-- abs3(-10)
-- 10

-- haskell do no type check entirely all conditions
-- so might run to Non-exhaustive patterns in function
sigma :: Int -> Int
sigma n | n < 0     = -1
        | n == 0    = 0
        | otherwise = 1


-- pattern matching (like Case in Scala/Switch)
not :: Bool -> Bool
not False = True
not True = False


(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && False = False
False &&  False = False

_ && _ = False
False && _ = False

-- patterns are mtched in order... so no optimization here
-- left to right top => bottom

-- [1,2,3,4]
-- its a shorthand notation for cons
-- 1:(2:(3:(4:[])))


-- x:xs matches non empty list
head :: [a] ->a
head (x:_) = x

-- match left to right will fail here , so you need parens
-- head x:_ = x
head (x:_) = x


---- lambdas (clojures -> they close over variables in outer scope)
double = \x -> x + x

-- when using curring on can express better

add x y = x + y
add2 = \x -> (\y -> x + y)

-- they both return function
const x _ = x
-- const x = \_ -> x

-- sectioning:
-- define function without name or lambdas
-- uses partial application
-- successor
-- (1+) 2
-- (+2) 1

-- doubling function
-- (*2)
--(/2) halving function


-- list comprehensions AKA sequel
-- multiple generators are like nested loops
comp = [(x, y) | y <-[4,5], x <-[1,2,3]]
-- [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]

comp2 = [(x, y) | x <-[1,2,3], y <-[4,5]]
-- [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

-- they can depend
comp3 = [(x, y) | x <-[1..3], y <- [x..3]]
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

concat2 :: [[a]] -> [a]
concat2 xss = [x | xs <- xss, x <- xs]
flatten = concat [[1,2,3],[4,5], [6]]
-- [1,2,3,4,5,6]

-- can have a guard
factors :: Int -> [Int]
factors n = [ x | x <-[1..n], n `mod` x == 0]
-- [1,3,5,15]

prime :: Int -> Bool
prime n = factors n == [1, n]
-- prime 3
-- True


primes :: Int -> [Int]
primes n = [x | x <-[1..n], prime x]

howManyPrimes :: Int -> Int
howManyPrimes n = length (primes n)
-- howManyPrimes 10
-- 4
-- 168

-- zip :: [a] -> [b] -> [(a,b)]
-- ['a','b','c'] [1,2,3,4]
-- [('a',1),('b',2),('c',3)]


pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

-- pairs [1,2,3,4]
-- [(1,2), (2,3), (3,4)]