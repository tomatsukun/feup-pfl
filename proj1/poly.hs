type Indet = (Char, Int) -- Indeterminate, a variable and its exponent
type Indets = [Indet] -- List of indeterminates on a monomial
type Mono = (Int, Indets) -- Monomial as a coefficient and a set of indeterminates
type Poly = [Mono] -- Polynomial as a list of monomials

-- Collapses a list of strings into one, using sep between elements
join :: String -> [String] -> String
join sep xs = foldr (\a b-> a ++ if b=="" then b else sep ++ b) "" xs

-- Less than operator for the Indet type
lessThanIndet :: Indet -> Indet -> Bool
lessThanIndet (c1, expo1) (c2, expo2)
  | c1 == c2 = expo1 > expo2
  | otherwise = c1 < c2

-- Less than operator for the Indets type
lessThanIndets :: Indets -> Indets -> Bool
lessThanIndets inds [] = False
lessThanIndets [] inds = True
lessThanIndets (ind1 : inds1) (ind2 : inds2)
  | lessThanIndet ind1 ind2 = True
  | lessThanIndet ind2 ind1 = False
  | otherwise = lessThanIndets inds1 inds2

-- Adds 2 polynomials, O(n), maintains normalization
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

-- Multiplies 2 sets of Indets, O(n)
multIndets :: Indets -> Indets -> Indets
multIndets [] [] = []
multIndets inds [] = inds
multIndets [] inds = inds
multIndets ((c1, expo1) : inds1) ((c2, expo2) : inds2)
  | c1 < c2 = (c1, expo1) : (multIndets inds1 ((c2, expo2) : inds2))
  | c2 < c1 = (c2, expo2) : (multIndets ((c1, expo1) : inds1) inds2)
  | otherwise = (c1, expo1 + expo2) : (multIndets inds1 inds2)

-- Multiplies 2 monomials
multMono :: Mono -> Mono -> Mono
multMono (coeff1, inds1) (coeff2, inds2)
  | coeff1 * coeff2 == 0 = (0, [])
  | otherwise = (coeff1 * coeff2, multIndets inds1 inds2)

-- Multiplies 2 polynomials, maintains normalization
multPoly :: Poly -> Poly -> Poly
multPoly poly [] = []
multPoly [] poly = []
multPoly (mono1 : poly1) poly2 = add (map (multMono mono1) poly2) (multPoly poly1 poly2)

-- Derives monomial to given char, O(n)
deriveMono :: Char -> Mono -> Mono
deriveMono d (coeff, []) = (0, [])
deriveMono d (0, inds) = (0, [])
deriveMono d (coeff, ((c, expo) : inds))
  | d /= c = (newCoeff, ((c, expo) : newInds))
  | expo == 1 = (newCoeff, newInds)
  | otherwise = (coeff * expo, ((c, expo - 1) : inds))
  where (newCoeff, newInds) = deriveMono d (coeff, inds)

-- Derives a polynomial to given char, O(n), maintains normalization
derivePoly :: Char -> Poly -> Poly
derivePoly c [] = []
derivePoly c (mono : poly)
  | newCoeff == 0 = derivePoly c poly
  | otherwise = (newCoeff, newInds) : (derivePoly c poly)
  where (newCoeff, newInds) = deriveMono c mono

-- Normalizes a given polynomial
normalize :: Poly -> Poly
normalize [] = []
normalize ((coeff, inds) : poly)
  | coeff == 0 = normalize poly
  | otherwise = add [(coeff, inds)] (normalize poly)

-- Returns a string representation of a given indeterminate
indetToString :: Indet -> String
indetToString (c, expo)
  | expo == 1 = c : []
  | otherwise = c : '^' : (show expo)

-- Returns a string representation of a given indeterminate set
indetsToString :: Indets -> String
indetsToString inds = join "*" (map indetToString inds)

-- Returns a string representation of a given Poly head
polyHeadToString :: Mono -> String
polyHeadToString (coeff, inds)
  | coeff == 1 = indetsToString inds
  | coeff == -1 = '-' : (indetsToString inds)
  | otherwise = (show coeff) ++ "*" ++ (indetsToString inds)

-- Returns a string representation of a given Poly body
polyBodyToString :: Poly -> String
polyBodyToString [] = ""
polyBodyToString ((coeff, inds) : poly)
  | coeff == 1 = " + " ++ (indetsToString inds) ++ (polyBodyToString poly)
  | coeff == -1 = " - " ++ (indetsToString inds) ++ (polyBodyToString poly)
  | coeff > 0 = " + " ++ (show coeff) ++ "*" ++ (indetsToString inds) ++ (polyBodyToString poly)
  | coeff < 0 = " - " ++ (show (-coeff)) ++ "*" ++ (indetsToString inds) ++ (polyBodyToString poly)

-- Returns a string representation of a given polynomial
polyToString :: Poly -> String
polyToString [] = "0"
polyToString (mono : poly) = (polyHeadToString mono) ++ (polyBodyToString poly)

main = do

    print (polyToString (add [(2, [('a', 1)])] [(-2, [('a', 1)])]))
    print (polyToString [(2, [('a', 3)]), (5, [('a', 1), ('b', 3)]), (3, [('x', 1)]), (-1, [('z', 5)])])
    print (polyToString [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])])
    print (polyToString (add [(2, [('a', 3)]), (5, [('a', 1), ('b', 3)]), (3, [('x', 1)]), (-1, [('z', 5)])] [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])]))
    print (polyToString (multPoly [(2, [('a', 3)]), (3, [('b', 2)])] [(-5, [('a', 1)]), (-1, [('b', 5)])]))
    print (polyToString [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])])
    print (polyToString (derivePoly 'a' [(-1, [('a', 1)]), (-5, [('a', 3)]), (1, [('c', 2)])]))
    print (polyToString (normalize [(2, [('b', 1)]), (0, [('a', 2)]), (-5, [('a', 1)]), (1, [('c', 2)])]))
