--Exercise 0
--Parenthesise the following arithmetic expressions:
--
--2 ^ 3 * 4
--2 * 3 + 4 * 5
--2 + 3 * 4 ^ 5

--solution:
--i guess is to not change result?

--(2 ^ 3) * 4
--(2 * 3) + (4 * 5)
--((2 + 3) * 4) ^ 5

--should stay the same

--Exercise 1
--The script below contains syntactic errors.
--Correct these errors and then choose right answer.

--N = a 'div' length xs
--    where
--        a = 10
--       xs = [1 ,2 , 3, 4, 5]

--solution:
main = putStrLn "Hello, World!"

n = a `div` length xs
    where
          a = 10
          xs = [1 ,2 , 3, 4, 5]

--Exercise 2
--The library function last, which selects
--the last element of a non-empty list, can be defined in
--terms of the library functions introduced in this chapter.
--Choose all possible definitions.


-- nope
--init xs = tail (reverse xs)
-- nope
--init xs = reverse ( head (reverse xs))
-- nope
--init xs = take (length xs ) xs

-- yes
init xs = reverse (tail (reverse xs))

-- nope
--init xs = drop (length xs - 1) xs

--nope, probably :)
--init xs = take (length xs - 1) (tail xs)

--test
d = [1 ,2 ,3]
init d == [1, 2]

--Exercise 4
--Given the following examples, give another possible
--calculation for the result of double (double 2)

--double (double 2)
--= { applying the inner double }
--double (2 + 2)
--= { applying double }
--(2 + 2) + (2 + 2)
--= { applying the ﬁrst + }
--4 + (2 + 2)
--= { applying the second + }
--4+4
--= { applying + }
--8


--Exercise 5
--Show that sum [x] = x for any number x.
--Sum is defined as follows:

sum [] = 0
sum (x :xs) = x + sum xs

--sum [x]
--=   { applying sum }
--x + sum []
--=   { applying sum }
--x + 0
--=   { applying + }
--x


--Exercise 6
--Define a function product that produces the product of a list of numbers,
--and show using your definition that product [2, 3, 4] = 24.

--product [2, 3, 4] = 24

product [] = 1
product (x: xs) = x * product xs
-- #wat? this is weird

--Exercise 7
--How should the definition of the function qsort be modified
--so that it produces a reverse sorted version of a list?
--Choose all possible definitions.

-- these one is ok
qsort [] = []
qsort (x :xs) = qsort larger ++ [x] ++ qsort smaller
    where   smaller = [a | a <- xs, a <= x]
            larger = [b | b <- xs, b > x]

qsort [] = []
qsort (x :xs) = qsort larger ++ [x] ++ qsort smaller
    where   larger = [a | a <- xs, a > x || a == x ]
            smaller = [b | b <- xs, b < x]


-- and so on :
qsort [] = []
qsort (x :xs)
    = reverse
        reverse (qsort smaller)) ++ [x] ++ reverse(qsort larger))
    where   smaller = [a | a <- xs, a <= x]
            larger = [b | b <- xs, b > x]


--Exercise 8
--What would be the effect of replacing <= by < in the definition
--of qsort? Choose all possible effects.

--Dupes removed from list?
--So maybe some inputs will not be sorted correctly ?