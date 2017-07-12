let nouns = ["hobo", "frog", "pope"]
let adjectives = ["lazy", "grouchy", "scheming"]
let test = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

length' xs = sum [1 | _ <- xs]
[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

main = print(test)