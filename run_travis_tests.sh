# octave tests
cd MATLAB
yes | sudo apt-add-repository ppa:octave/stable > /dev/null
sudo apt-get -qq update
sudo apt-get -qq install octave > /dev/null
octave -q --eval setup.m
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py -q install > /dev/null 2>&1
./run_python_tests.sh