# octave tests
cd MATLAB
yes | sudo apt-add-repository ppa:octave/stable &> add_octave_repo_output.txt
sudo apt-get -qq update
sudo apt-get -qq install octave &> install_octave_output.txt
octave -q --eval setup.m
./run_octave_tests.sh
cd ..

# python tests
cd Python
python setup.py -q install &> install_python_package_output.txt
./run_python_tests.sh