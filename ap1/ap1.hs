
--1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c =
   if  (a < (b + c)) && (b < (a + c)) && (c < (a + b))
     then True
     else False

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt(s * (s - a) * (s-b) * (s-c))
                      where s = (a+b+c)/2


--1.3
metades :: [Int] -> ([Int], [Int])
metades myList =
    let halfLength = div (length myList) 2
    in (take halfLength myList, drop 3 myList)

--1.4 a)

myLast1 :: [Int] -> Int
myLast1 a = head (reverse a)

myLast2 :: [Int] -> Int
myLast2 a = a !! ((length a) - 1)

--1.4 b)
myInit1 :: [Int] -> [Int]
myInit1 a =  reverse (tail(reverse a))

myInit2 :: [Int] -> [Int]
myInit2 a = reverse (drop 1 (reverse a))

--1.5 a)
binom :: Integer -> Integer -> Integer
binom n k = ( product [1..n] ) `div` ( (product [1..k]) * (product [1..(n-k)])  )

--1.5 b)
binom1 :: Integer -> Integer -> Integer
binom1 n k =
  if k < n - k
   then product [n-k+1..n] `div` product [1..k]
   else product [k+1..n] `div` product [1..n-k]


--1.6)
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c =
  let bino = (b*b)-(4*a*c)

  in if bino == 0 then ((-b) / (2*a),(-b) / (2*a))
     else if bino < 0 then (0,0)
     else if bino > 0 then ( (-b - sqrt (bino)) / (2*a) , (-b + sqrt (bino)) / (2*a) )
     else (-1111.11, -1111.11)

{-
1.7
a) char, string, int, integer, float, double

b)

c)

d)

e) char, int, integer, float, double

f)
-}
--1.9)
classifica :: Int -> String
classifica a | a <= 9 = "reprovado"
             | 10 <= a && a <= 12  = "suficiente"
             | 13 <= a && a <= 15  = "bom"
             | 16 <= a && a <= 18  = "muito bom"
             | 19 <= a && a <= 20  = "muito bom com distinção"

--1.10)
classificaIMC :: Float -> Float -> String
classificaIMC peso altura
    | peso/(altura*altura) < 18.5 = "baixo peso"
    | 18.5 <= peso/(altura*altura) && peso/(altura*altura) < 25 = "peso normal"
    | 25 <= peso/(altura*altura) && peso/(altura*altura) < 30 = "excesso de peso"
    | 30 <= peso/(altura*altura) = "obesidade"

--1.11 a)
max1, min1 :: Ord a => a -> a -> a
max1 x y = if x>=y then x else y
min1 x y = if x<=y then x else y

--1.12)
xor :: Bool -> Bool -> Bool
xor a b | (a/=b) = True
        | (a==b) = False


--1.13)
safetail :: [a] -> [a]
safetail [] = []
safetail (x:xs) = xs

--1.14 a)

curta1 :: [a] -> Bool
curta1 a | 2 < length a = False
         | otherwise = True


--1.14 b)
curta a | l == 0 = True
        | l == 1 = True
        | l == 2 = True
        | otherwise = False
        where l = length a

--1.15 a)
{-
medianaA :: Int -> Int -> Int -> Int
medianaA a b c | b <= a && a >= c
  -}

--1.15 b)
medianaB :: Int -> Int -> Int -> Int
medianaB a b c = (a+b+c) - ( (max (max a b) c) + (min (min a b) c) )




























--)
