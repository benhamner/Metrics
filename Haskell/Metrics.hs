
module Metrics
    ( ae
    , se
    , sle
    , mae
    , mse
    , msle
    , rmse
    , rmsle
    , levenshtein
    , ll
    , logLoss
    , apk
    , mapk
    , auc, fstEqual, auc1, sumRank, sumEl
    , ce
    ) where

import Data.List (groupBy, sort)
import Math.Statistics (mean)

ae :: Num a => a -> a -> a
ae x y = abs (x-y)

se :: Num a => a -> a -> a
se x y = (x-y)^2

sle :: Double -> Double -> Double
sle x y = ((log (x+1)) - (log (y+1)))^2

infinity :: Double
infinity = -(log 0)

meanZipWith :: (a -> b -> Double) -> [a] -> [b] -> Double
meanZipWith = ((mean .) .) . zipWith

meanInfZipWith :: (a -> b -> Double) -> [a] -> [b] -> Double
meanInfZipWith f a1 a2
    | any (==infinity) (zipWith f a1 a2) = infinity
    | otherwise = meanZipWith f a1 a2

mae :: [Double] -> [Double] -> Double
mae = meanZipWith ae

mse :: [Double] -> [Double] -> Double
mse = meanZipWith se

msle :: [Double] -> [Double] -> Double
msle = meanZipWith sle

rmse :: [Double] -> [Double] -> Double
rmse = (sqrt .) . mse

rmsle :: [Double] -> [Double] -> Double
rmsle = (sqrt .) . msle

ll :: Double -> Double -> Double
ll 1 y = -log y
ll 0 y = -log (1-y)

logLoss :: [Double] -> [Double] -> Double
logLoss = meanInfZipWith ll

apk :: Int -> [Integer] -> [Integer] -> Double
apk k actual predicted = (apsum actual (take k predicted) [] 0.0 0.0 0.0) / (fromIntegral (min k (length actual))) where
    apsum _ [] _ acc _ _ = acc
    apsum actual (p:ps) visited acc i j
        | (elem p actual) && (not (elem p visited)) = apsum actual ps (p:visited) (acc+(i+1.0)/(j+1.0)) (i+1.0) (j+1.0) 
        | otherwise = apsum actual ps visited acc i (j+1.0)

mapk :: Int -> [[Integer]] -> [[Integer]] -> Double
mapk k = meanZipWith (apk k)

auc :: [Double] -> [Double] -> Double
auc a p = ((sumRank a p) - (sumEl 1 a)*(((sumEl 1 a)+1)/2.0)) / ((sumEl 1 a)*(sumEl 0 a))

fstEqual x y = (fst x) == (fst y)
auc1 actual predicted = groupBy fstEqual (sort (zip predicted actual))
sumRank actual predicted = sumRankAccum (auc1 actual predicted) 0.0 0 where
    sumRankAccum [] rSum r = rSum
    sumRankAccum (x:xs) rSum r = sumRankAccum xs (rSum+curPos*(r+curRank)) (r+curRank) where
        curRank = (fromIntegral (1+(length x))) / 2.0
        curPos = sum [1.0 | el <- x, (snd el)==1]
sumEl el a = fromIntegral (length (filter (==el) a))

ce :: Eq a => [a] -> [a] -> Double
ce actual predicted = ((sum [1.0 | (a,p) <- (zip actual predicted), a/=p]) 
                       / (fromIntegral (length actual)))

levenshtein :: Eq a => [a] -> [a] -> Int
levenshtein s t =
    d !! (length s) !! (length t)
    where d = [[distance m n|n <- [0..length t]] | m <- [0..length s]]
          distance i 0 = i
          distance 0 j = j
          distance i j = minimum [d!!(i-1)!!j + 1,
                                  d!!i!!(j-1) + 1,
                                  d!!(i-1)!!(j-1) + (if s!!(i-1)==t!!(j-1) then 0 else 1)]
