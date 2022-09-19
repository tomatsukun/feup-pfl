
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


{--1.3
metades :: [Int] -> ([Int], [Int])
metades a[] == ( b[], c[] )
  let cont = length a
  let aux[] == []
  let d = head a
    insert d b[]
   tail a 
cont = cont - 1
if cont >= (length a / 2) then False
    --}



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
     else if bino < 0 then (-111.11, -111.11 )
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