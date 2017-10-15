#!/bin/bash

while getopts ":s:r:e:o:h:" opt; do
  case $opt in
  	s)
	  SOURCE=$OPTARG
	  ;;
    r)
	  REQUREMENTS=$OPTARG
	  ;;
	e)
	  ENVIRONMENT=$OPTARG
	  ;;
	o)
	  OUT=$OPTARG
	  ;;
    h)
      echo ""
      ;;
  esac
done
# Check set environment and get its bin location
case $ENVIRONMENT in
	'python2.7')
		ENV_LOCATION=$(which python)
		;;
	'python3.6')
		ENV_LOCATION=$(which python3)
		;;
	esac
done
# Save constants
TMP=/tmp/pypackager
TMP_ENV=${TMP}/env/
TMP_DST=${TMP}/dst/

# Create temporary directories for the build
mkdir ${TMP} ${TMP_ENV} ${TMP_DST}
# Create virtual environment and activate it
virtualenv -p ${ENV_LOCATION} ${TMP_ENV} && source ${TMP_ENV}/bin/activate
# Install necessary dependencies
pip3 install -r ${REQUREMENTS}
# Log out from environment
deactivate
# Copy bundle files and its dependencies
cp -rf ${TMP_ENV}/lib/${ENVIRONMENT}/site-packages/* ${TMP_DST}
cp -rf ${SOURCE} ${TMP_DST}
# Zip package and save in provided ${OUT} destination
cd ${TMP_DST}
zip ${OUT} .
# Cleanup temporary directory
cd && rm -rf /tmp/pypackager
