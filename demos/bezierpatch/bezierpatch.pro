TEMPLATE = app
TARGET = bezierpatch

VPATH += ../mandelbrot
INCLUDEPATH += ../mandelbrot

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

QT += concurrent widgets opengl

# Input
SOURCES += main.cpp \
           beziermainwindow.cpp \
           bezierwidget.cpp \
           qglcamera.cpp \
           framerate.cpp
HEADERS += bezierwidget.h \
           beziermainwindow.h \
           qglcamera.h \
           framerate.h
RESOURCES += bezierpatch.qrc
FORMS += beziermainwindow.ui
