-- TODO euler91 (tringles)
--a^2 + b^2 = c^2
--https://projecteuler.net/problem=91
--There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between 0 and 2 inclusive; that is,
--0 ≤ x1, y1, x2, y2 ≤ 2.

--Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?
triangles = [ (a,b,c) | c <- [1..100], b <- [1..100], a <- [1..10] ]
tianglesWithRightAngle = [(a,b,c) | c <- [1..50], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
-- [(3,4,5),(6,8,10)]
--euler91 = length tianglesWithRightAngle
--2

distance (x1 , y1) (x2 , y2) = sqrt (x' * x' + y' * y')
    where
      x' = x1 - x2
      y' = y1 - y2

--distance (1, 1) (2, 2)

max = 10
--no need for x3,y3 since we have single c^2 we can get a^2 and b^2
-- or do we need it ?
allPoints = [((x1, y1), (x2, y2)) | x1 <- [0..max], x2 <- [0..max], y1 <- [0..max], y2 <-[0..max]]
--distance ((10,10),(10,3))

