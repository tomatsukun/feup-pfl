type Indet = (Char, Int)
type Indets = [Indet]
type Mono = (Int, Indets)
type Poly = [Mono]

join :: String -> [String] -> String
join sep xs = foldr (\a b-> a ++ if b=="" then b else sep ++ b) "" xs

lessThanIndet :: Indet -> Indet -> Bool
lessThanIndet (c1, expo1) (c2, expo2)
  | c1 == c2 = expo1 > expo2
  | otherwise = c1 < c2

lessThanIndets :: Indets -> Indets -> Bool
lessThanIndets inds [] = False
lessThanIndets [] inds = True
lessThanIndets (ind1 : inds1) (ind2 : inds2)
  | lessThanIndet ind1 ind2 = True
  | lessThanIndet ind2 ind1 = False
  | otherwise = lessThanIndets inds1 inds2

add :: Poly -> Poly -> Poly
add [] [] = []
add poly [] = poly
add [] poly = poly
add ((coeff1, inds1) : poly1) ((coeff2, inds2) : poly2)
  | coeff1 == 0 = add poly1 ((coeff2, inds2) : poly2)
  | coeff2 == 0 = add ((coeff1, inds1) : poly1) poly2
  | lessThanIndets inds1 inds2 = (coeff1, inds1) : (add poly1 ((coeff2, inds2) : poly2))
  | lessThanIndets inds2 inds1 = (coeff2, inds2) : (add ((coeff1, inds1) : poly1) poly2)
  | coeff1 + coeff2 == 0 = (add poly1 poly2)
  | otherwise = (coeff1 + coeff2, inds1) : (add poly1 poly2)

multIndets :: Indets -> Indets -> Indets
multIndets [] [] = []
multIndets inds [] = inds
multIndets [] inds = inds
multIndets ((c1, expo1) : inds1) ((c2, expo2) : inds2)
  | c1 < c2 = (c1, expo1) : (multIndets inds1 ((c2, expo2) : inds2))
  | c2 < c1 = (c2, expo2) : (multIndets ((c1, expo1) : inds1) inds2)
  | otherwise = (c1, expo1 + expo2) : (multIndets inds1 inds2)

multMono :: Mono -> Mono -> Mono
multMono (coeff1, inds1) (coeff2, inds2)
  | coeff1 * coeff2 == 0 = (0, [])
  | otherwise = (coeff1 * coeff2, multIndets inds1 inds2)

multPoly :: Poly -> Poly -> Poly
multPoly poly [] = []
multPoly [] poly = []
multPoly (mono1 : poly1) poly2 = add (map (multMono mono1) poly2) (multPoly poly1 poly2)

deriveMono :: Char -> Mono -> Mono
deriveMono d (coeff, []) = (0, [])
deriveMono d (0, inds) = (0, [])
deriveMono d (coeff, ((c, expo) : inds))
  | d /= c = (newCoeff, ((c, expo) : newInds))
  | expo == 1 = (newCoeff, newInds)
  | otherwise = (coeff * expo, ((c, expo - 1) : inds))
  where (newCoeff, newInds) = deriveMono d (coeff, inds)


derivePoly :: Char -> Poly -> Poly
derivePoly c [] = []
derivePoly c (mono : poly)
  | newCoeff == 0 = derivePoly c poly
  | otherwise = (newCoeff, newInds) : (derivePoly c poly)
  where (newCoeff, newInds) = deriveMono c mono

printIndet :: Indet -> String
printIndet (c, expo)
  | expo == 1 = c : []
  | otherwise = c : '^' : (show expo)

printIndets :: Indets -> String
printIndets inds = join "*" (map printIndet inds)

printPolyHead :: Mono -> String
printPolyHead (coeff, inds)
  | coeff == 1 = printIndets inds
  | coeff == -1 = '-' : (printIndets inds)
  | otherwise = (show coeff) ++ "*" ++ (printIndets inds)

printPolyBody :: Poly -> String
printPolyBody [] = ""
printPolyBody ((coeff, inds) : poly)
  | coeff == 1 = " + " ++ (printIndets inds) ++ (printPolyBody poly)
  | coeff == -1 = " - " ++ (printIndets inds) ++ (printPolyBody poly)
  | coeff > 0 = " + " ++ (show coeff) ++ "*" ++ (printIndets inds) ++ (printPolyBody poly)
  | coeff < 0 = " - " ++ (show (-coeff)) ++ "*" ++ (printIndets inds) ++ (printPolyBody poly)

printPoly :: Poly -> String
printPoly [] = ""
printPoly (mono : poly) = (printPolyHead mono) ++ (printPolyBody poly)

main = do  
    print (printPoly (add [(2, [('a', 1)])] [(3, [('a', 1), ('b', 3)])]))
    print (printPoly [(2, [('a', 3)]), (5, [('a', 1), ('b', 3)]), (3, [('x', 1)]), (-1, [('z', 5)])])
    print (printPoly [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])])
    print (printPoly (add [(2, [('a', 3)]), (5, [('a', 1), ('b', 3)]), (3, [('x', 1)]), (-1, [('z', 5)])] [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])]))
    print (printPoly (multPoly [(2, [('a', 3)]), (3, [('b', 2)])] [(-5, [('a', 1)]), (-1, [('b', 5)])]))
    print (printPoly (derivePoly 'a' [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])]))
