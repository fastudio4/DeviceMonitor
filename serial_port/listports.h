#ifndef LISTPORTS_H
#define LISTPORTS_H

#include <QObject>
#include "serialportitem.h"

class ListPorts : public QObject
{
    Q_OBJECT
public:
    explicit ListPorts(QObject *parent = nullptr);
    virtual ~ListPorts();
    Q_INVOKABLE QStringList ports();
    Q_INVOKABLE void portChanged(QString);

signals:
    void newDev(QObject *);
    void selectPort(QObject *);
    void updateData(QObject *);
private slots:
    void update(bool);
    void objPort(QString);

private:
    void createPorts();
    void portInList();
    void oflinePorts(const QStringList &);
    QList<SerialPortItem *> _ports;
    QStringList portsName;
};

#endif // LISTPORTS_H
