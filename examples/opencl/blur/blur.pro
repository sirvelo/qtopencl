TEMPLATE = app
TARGET = blur

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
            LIBS += -L'C:/Program Files (x86)/Intel/OpenCL SDK/4.6/lib/x64' -L'D:/QtOpenCL/debug/lib' -lOpenCL -lQtOpenCL -lQtOpenCLGL
        }
        CONFIG(release, debug | release) {
            LIBS += -L'C:/Program Files (x86)/Intel/OpenCL SDK/4.6/lib/x64' -L'D:/QtOpenCL/release/lib' -lOpenCL -lQtOpenCL -lQtOpenCLGL
        }
    }
}

macx: {
    LIBS += -framework OpenCL
}

QT += widgets concurrent

# Input
SOURCES += main.cpp \
           blurwidget.cpp
HEADERS += blurwidget.h \
           blurtable.h
RESOURCES += blur.qrc
