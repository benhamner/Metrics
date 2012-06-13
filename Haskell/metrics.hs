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
