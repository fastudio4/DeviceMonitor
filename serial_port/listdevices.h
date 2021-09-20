#ifndef LISTDEVICES_H
#define LISTDEVICES_H

#include <QObject>
#include "devicertu.h"

class ListDevices : public QObject
{
    Q_OBJECT
public:
    explicit ListDevices(QObject *parent = nullptr);
    virtual ~ListDevices();
    Q_INVOKABLE void newDevice(QString shortDesc,
                               int idDevice,
                               int operation,
                               int startAddr,
                               int count,
                               QString portName,
                               int typeReg,
                               bool state);
signals:
    void newDevice(QString);
private slots:
    void parentDevice(QObject *);
private:
    QList<DeviceRTU*> _devices;

    void clear();

    QString _shortDesc;
    int _idDevice;
    int _operation;
    int _startAddr;
    int _count;
    QString _portName;
    int _typeReg;
    bool _state;

};

#endif // LISTDEVICES_H
