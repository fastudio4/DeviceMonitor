QT += quick virtualkeyboard serialport serialbus quickcontrols2

CONFIG += c++11

SOURCES += \
        main.cpp \
        models/listmodel.cpp \
        models/propertylistmodel.cpp \
        serial_port/devicertu.cpp \
        serial_port/listports.cpp \
        serial_port/serialportitem.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    models/listmodel.h \
    models/propertylistmodel.h \
    serial_port/devicertu.h \
    serial_port/listports.h \
    serial_port/serialportitem.h
