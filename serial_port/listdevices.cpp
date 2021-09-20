#include "listdevices.h"
#include <QDebug>

ListDevices::ListDevices(QObject *parent)
    : QObject(parent)
{

}

ListDevices::~ListDevices()
{
    qDeleteAll(_devices.begin(), _devices.end());
    _devices.clear();
}

void ListDevices::newDevice(QString shortDesc,
                            int idDevice,
                            int operation,
                            int startAddr,
                            int count,
                            QString portName,
                            int typeReg,
                            bool state)
{
    emit newDevice(portName);
    clear();
    _shortDesc = shortDesc;
    _idDevice = idDevice;
    _operation = operation;
    _startAddr = startAddr;
    _count = count;
    _portName = portName;
    _typeReg = typeReg;
    _state = state;

}

void ListDevices::parentDevice(QObject * parent)
{
    DeviceRTU *newDevice = new DeviceRTU(_shortDesc,
                                         _idDevice,
                                         _operation,
                                         _startAddr,
                                         _count,
                                         _typeReg,
                                         _state,
                                         parent);
    _devices.append(newDevice);
    qDebug() << "device is added!";
}

void ListDevices::clear()
{
    _shortDesc.clear();
    _idDevice = 0;
    _operation = -1;
    _startAddr = 0;
    _count = 0;
    _portName.clear();
    _typeReg = -1;
    _state = false;
}


