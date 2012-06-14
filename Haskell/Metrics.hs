
module Metrics
    ( ae
    , se
    , sle
    , mae
    , mse
    , msle
    , rmse
    , rmsle
    , ll
    , logLoss
    , apk
    , mapk
    ) where

import Math.Statistics (mean)

ae :: Num a => a -> a -> a
ae x y = abs (x-y)

se :: Num a => a -> a -> a
se x y = (x-y)^2

sle :: Double -> Double -> Double
sle x y = ((log x+1) - (log y+1))^2

meanZipWith :: (a -> b -> Double) -> [a] -> [b] -> Double
meanZipWith = ((mean .) .) . zipWith

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
logLoss = meanZipWith ll

apk :: Int -> [Integer] -> [Integer] -> Double
apk k actual predicted = (apsum actual (take k predicted) [] 0.0 0.0 0.0) / (fromIntegral (min k (length actual))) where
    apsum _ [] _ acc _ _ = acc
    apsum actual (p:ps) visited acc i j
        | (elem p actual) && (not (elem p visited)) = apsum actual ps (p:visited) (acc+(i+1.0)/(j+1.0)) (i+1.0) (j+1.0) 
        | otherwise = apsum actual ps visited acc i (j+1.0)

mapk :: Int -> [[Integer]] -> [[Integer]] -> Double
mapk k = meanZipWith (apk k)
