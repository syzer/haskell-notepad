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