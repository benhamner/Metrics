# octave tests
cd MATLAB
sudo sh install_octave_linux.sh > /dev/null 2>&1
octave -q --eval setup
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py -q install > /dev/null 2>&1
./run_python_tests.sh
cd ..

# Haskell tests 
sudo apt-get install ghc6 ghc6-prof ghc6-doc cabal-install > /dev/null 2>&1
cd Haskell
sudo cabal update > /dev/null 2>&1
sudo cabal install --ghc-options="-hide-package haskell98" > /dev/null 2>&1
sudo cabal install HUnit > /dev/null 2>&1
runhaskell testMetrics.hs
cd ..

# R tests
sudo apt-get install r-base-dev > /dev/null 2>&1
sudo R CMD INSTALL R > /dev/null
cd R
sudo R -f install_r_packages.r > /dev/null
sh run_r_tests.sh
cd ..

# Starting to test C#
sudo apt-get install mono-complete > /dev/null 2>&1
gmcs hellomono.cs
mono hellomono.exe
