--2.1 a)
myand :: [Bool] -> Bool
myand [] = True
myand (x:xs)
             | (x == False) = False
             | (x == True) = myand xs
             | otherwise = True


--2.1 b)
myor :: [Bool] -> Bool
myor [] = False
myor (x:xs)
             | (x == True) = True
             | otherwise = myor xs

--2.1 c)
myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = (x) ++ (myconcat xs)

--2.1 d)
myreplicate :: Int -> a -> [a]
myreplicate 0 a = []
myreplicate n a = [a] ++ replicate (n-1) a


--2.1 e)
myselect :: [a] -> Int -> a
myselect (x:xs) n
              | (n == 0) = x
              | otherwise = myselect (xs) (n-1)


--2.1 f)
myelem :: Eq a => a -> [a] -> Bool
myelem v [] = False
myelem v (x:xs)
                | (x == v) = True
                | otherwise = myelem v xs


--2.2)
interperse :: a -> [a] -> [a]
interperse a [] = []
interperse a (x:xs)
                    | length xs == 0 = [x]
                    | otherwise = [x] ++ [a] ++ (interperse a (xs))

--2.3)
mdc :: Integer -> Integer -> Integer
mdc a 0 = a
mdc a b = mdc b (mod a b)


--2.4 a)
insert :: Ord a => a -> [a] -> [a]
insert e [] = [e]
insert e (x:xs)
        | e <= x = (e:x:xs)
        | otherwise = x : insert e xs

--2.4 b)
isort :: Ord a => [a] -> [a]
isort [] = []
isort [a] = [a]
isort a = insert (last a) (isort (init a))

--2.5 a)
myminimum :: Ord a => [a] -> a
myminimum [a] = a
myminimum (x:y:xs) = myminimum ((if x < y then x else y):xs)

--2.5 b)
mydelete :: Eq a => a -> [a] -> [a]
mydelete e [] = []
mydelete e (x:xs) =
    if x == e
      then xs
      else x : (mydelete e xs )

--2.5 c)--duvida
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort [a] = [a]
ssort (x:xs) = (minimum (x:xs)) : (ssort xs)


--2.6)
soma :: Double
soma = sum[x^2 | x <- [1..100]]

--2.7 a)
--aproxAux :: Int -> Double
--aproxAux a =  sum[ fromIntegral (((-1)^2)) / fromIntegral (2*n + 1) | n <- [1..a]]

--prox :: Int -> Double
--aprox a = 4 * ( 1 - (aproxAux a) )


--2.7 b)


--2.8)
dotprod :: [Float] -> [Float] -> Float
dotprod a b = sum[ x*y | (x,y) <- zip a b]


--2.9)
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n], mod n x == 0 && x /= n]

--2.10)
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], sum (divprop x) == x && n /= x]

--2.11)
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos a = [ (x,y,z) | x <- [1..a], y <- [1..a], z <- [1..a], (x^2)+(y^2)==(z^2)]

--2.12)
primo :: Integer -> Bool
primo n = length (divprop n ) == 1

--2.13)
--mersennes :: [Int]
--mersennes = [ ((2^n)-1) | n <- [0..30] ]


--2.14)
binom1 :: Integer -> Integer -> Integer
binom1 n k = product [1..n] `div` (product [1..k] * product [1..(n-k)])

pascal :: Integer -> [[Integer]]
pascal m = [m | n <- [0..m], let m = [binom1 n k | k <- [0..n]] ]

--2.15)
{--
cifrar :: Int -> String -> String
cifrar n [] = []
cifrar n s =[
  if fromEnum c > 64 && fromEnum c < 91 then toEnum (mod (fromEnum c - 65 + n) 26 + 65) else
  if fromEnum c > 96 && fromEnum c < 123 then toEnum (mod (fromEnum c - 96 + n) 26 + 96) else c | c <- s]
--}

--2.16)
myConcat' :: [[a]] -> [a]
myConcat' l = [x | xs <- l, x <- xs]

myReplicate' :: Integral a => a -> b -> [b]
myReplicate' a b = [b | cont <- [1..a]]

mySelect' :: Int -> [a] -> a
mySelect' a l = tail [x | cont <-]



























--
