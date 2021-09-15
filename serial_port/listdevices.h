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

signals:
private:
    QList<DeviceRTU*> _ports;
};

#endif // LISTDEVICES_H
