# octave tests
sudo apt-get install -qq octave
cd MATLAB
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py install
./run_python_tests.sh