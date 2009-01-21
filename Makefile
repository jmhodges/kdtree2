#
# KD_TREE2
#      A Fortran 95 module and C++ classes
#      for finding close neighbors in data sets of
#      points in k-dimensional Euclidean space. 
#


all:
	(cd src-c++;  make)
	(cd src-f90; make)

MY_DIR=`basename ${PWD}`

tar:
	/bin/rm *~ */*~; cd ..; tar zcvf ${MY_DIR}.tgz ${MY_DIR}
	cd ..; /bin/rm ${MY_DIR}.zip; zip -r ${MY_DIR}.zip ${MY_DIR}

clean:
	(cd src-c++; make clean)
	(cd src-f90; make clean) 
