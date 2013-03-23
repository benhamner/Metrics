# octave tests
cd MATLAB
sudo apt-get install -qq octave
octave --eval setup.m
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py install
./run_python_tests.sh