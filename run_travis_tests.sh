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

# R tests
sudo apt-get install r-base-dev > /dev/null 2>&1
sudo R CMD INSTALL R > /dev/null
cd R
sudo R -f install_r_packages.r > /dev/null
sh run_r_tests.sh
cd ..

# Haskell tests 
sudo apt-get install ghc6 ghc6-prof ghc6-doc cabal-install
cd Haskell
sudo cabal update
sudo ghc-pkg hide haskell98
sudo cabal install
runhaskell testMetrics.hs