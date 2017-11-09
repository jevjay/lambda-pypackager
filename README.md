# lambda-pypackager
Small utility to simplify Lambda python deployment package generation

## Usage
In order to successfully create Lambda deployment package, following parameters needs to be supplied:

 - s: (source) path to the script source code
 - r: (requirements) path to the requirements file, which contains list of python packages/dependencies. More information: https://pip.pypa.io/en/stable/user_guide/#requirements-files
 - e: (environment) python environment to be used in deployement. Possible calues: 'python2.7', 'python3.6'
 - o: (output) local destination where deployemnet package should be saved.

### Example
./lambda-pypackager.sh -s ~/index.py -r ~/requirements.txt -e python3.6 -o ~/bundle.zip
