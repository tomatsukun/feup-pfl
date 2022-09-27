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








































--
