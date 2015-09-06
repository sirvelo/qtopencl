#load(qttest_p5.prf)
TEMPLATE=app
QT += testlib concurrent
CONFIG += unittest warn_on

SOURCES += tst_qcl.cpp
RESOURCES += tst_qcl.qrc
