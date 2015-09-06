TARGET     = QtOpenCLGL
QT         += core-private gui-private concurrent opengl
TEMPLATE = lib

win32-msvc*|win32-icc:QMAKE_LFLAGS += /BASE:0x66000000
solaris-cc*:QMAKE_CXXFLAGS_RELEASE -= -O2 opencl

#QMAKE_DOCS = $$PWD/doc/qtopenclgl.qdocconf
#load(qt_module)

win32 {
    INCLUDEPATH += 'C:/Program Files (x86)/Intel/OpenCL SDK/4.6/include' \
            'D:/QtOpenCL/include'
    !isEmpty(QMAKE_INCDIR_OPENCL) {
        QMAKE_CXXFLAGS += -I$$QMAKE_INCDIR_OPENCL
    }
    !isEmpty(QMAKE_LIBDIR_OPENCL) {
        LIBS += -L$$QMAKE_LIBDIR_OPENCL
    }
    !isEmpty(QMAKE_LIBS_OPENCL) {
        LIBS += $$QMAKE_LIBS_OPENCL
    } else {
        CONFIG(debug, debug | release) {
            LIBS += -L'C:/Program Files (x86)/Intel/OpenCL SDK/4.6/lib/x64' -L'D:/QtOpenCL/debug/lib' -lOpenCL -lQtOpenCL
        }
        CONFIG(release, debug | release) {
            LIBS += -L'C:/Program Files (x86)/Intel/OpenCL SDK/4.6/lib/x64' -L'D:/QtOpenCL/release/lib' -lOpenCL -lQtOpenCL
        }
    }
}

macx: {
    LIBS += -framework OpenCL
}

no_cl_gl {
    DEFINES += QT_NO_CL_OPENGL
}

INCLUDEPATH += $$PWD/../opencl

HEADERS += \
    qclcontextgl.h \
    qclcontextgl.h

SOURCES += \
    qclcontextgl.cpp

PRIVATE_HEADERS += \
    qcl_gl_p.h

HEADERS += $$PRIVATE_HEADERS
DEFINES += QT_BUILD_CLGL_LIB
