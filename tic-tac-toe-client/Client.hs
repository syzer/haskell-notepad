module Client where
import Prelude


main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrL n ("Hey " ++ name ++ ", you rock!")