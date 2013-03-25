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
sudo apt-get install r-base-dev
sudo R CMD INSTALL R
cd R
sudo R -f install_r_packages.r
sh run_r_tests.sh
cd ..