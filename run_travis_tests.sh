# octave tests
cd MATLAB
yes | sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install -qq octave
octave --eval setup.m
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py install
./run_python_tests.sh