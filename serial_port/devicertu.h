#ifndef DEVICERTU_H
#define DEVICERTU_H

#include <QObject>

class DeviceRTU : public QObject
{
    Q_OBJECT
public:
    explicit DeviceRTU(QObject *parent = nullptr);

signals:

};

#endif // DEVICERTU_H
