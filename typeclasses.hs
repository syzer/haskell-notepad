module TypeClasses (
move,
Point,
Shape(..)
) where
----- data clases
--making-our-own-types-and-typeclasses
--data Shape = Circle Float Float Float | Rectangle Float Float Float Float

-- :t Circle
-- Circle :: Float -> Float -> Float -> Shape

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

test = surface $ Circle 10 20 10
--314.15927

-- Show is typeclass
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
-- Circle 10 20 10
-- Circle 10.0 20.0 10.0

--map (Circle 10 20) [4,5,6,6]
--[Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)


surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)
--surface (Rectangle (Point 0 0) (Point 100 100))
-- quite cool

--10000.0
--surface (Circle (Point 0 0) 24)
--1809.5574


move :: Shape -> Float -> Float -> Shape
move (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
move (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

--move (Rectangle (Point 0 10) (Point 10 15)) 5 0
--Rectangle (Point 5.0 10.0) (Point 15.0 15.0)

----- records
data Person = Person String String Int Float String String deriving (Show)

firstName :: Person -> String
firstName (Person firstname _ _ _ _ _) = firstname

lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname

age :: Person -> Int
age (Person _ _ age _ _ _) = age

height :: Person -> Float
height (Person _ _ _ height _ _) = height

phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number _) = number

flavor :: Person -> String
flavor (Person _ _ _ _ _ flavor) = flavor

let guy = Person "Doge" "Coin" 43 184.2 "526-2928" "Chocolate"

data Person = Person { firstName :: String, lastName :: String, age :: Int} deriving (Eq)

data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)
Car { company = "Ford", model = "Mustang", year = 1967 }
Car { company = "Ford", model = "Mustang", year = 1967 }
let adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
let mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}
mca == adRock
--False

let beastieBoys = [mca, adRock]
mca `elem` beastieBoys

--Read is inverse of Show
read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person

-- type classes are more like interfaces to data
--ex: eq type class for comparision

type PhoneBook = [(String,String)]
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]
type AssocList k v = [(k,v)]

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
--data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)
4 `Cons` (5 `Cons` Empty)
--Cons 4 (Cons 5 Empty)
3 `Cons` (4 `Cons` (5 `Cons` Empty))

--infixr 5 :-:

-- BST
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

