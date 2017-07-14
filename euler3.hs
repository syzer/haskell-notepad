--euler 3
import Math.NumberTheory.Primes.Factorisation


--prime_factors n =
--  case factors of
--    [] -> [n]
--    _  -> factors ++ prime_factors (n `div` (head factors))
--  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]