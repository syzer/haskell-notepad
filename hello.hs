main = putStrLn "Hello, World!"

--\x ->
add :: (Int, Int) -> Int
add (x,y) = x + y

add 3 4

-- add using lambda
add2 = \(x, y) -> x+y

--add3 :: Int -> Int -> Int
add3 x y = x + y

--curried
add` = \x -> \y -> x + y


-- type inference and type classes
:t (5 == 4, 'a')
-- (5 == 4, 'a') :: (Bool, Char)

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- typeclasses like java interface (but better)
:t (==)
-- (==) :: Eq a => a -> a -> Bool
-- Eq is a class (=>), its a type class,
-- all haskell functions implement this class

-- ordeting is a type class
:t (>)
(>) :: Ord a => a -> a -> Bool
"ZZZAAZZ" < "zZZAAZZ"
--True
--"ZZZAAZZ" > "zZZAAZZ"
--"ZZZAAZZ" `compare` "zZZAAZZ"

read "5"
-- exception

read "5" :: Float
-- 5.0

-- ord is typeclass
succ 'A'
pred 'B'
['a'..'e']
"abcde"