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
    void newDevice();
    void portChanged(QString);
    void updatePorts();

public slots:
//    void onPortChanged();


};

#endif // LISTDEVICES_H
