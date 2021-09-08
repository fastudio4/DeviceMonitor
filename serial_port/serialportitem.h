#ifndef SERIALPORTITEM_H
#define SERIALPORTITEM_H

#include <QSerialPort>
#include "devicertu.h"

class SerialPortItem : public QSerialPort
{
    Q_OBJECT
    Q_PROPERTY(QStringList namesProperty READ namesProperty)
    Q_PROPERTY(int timeout READ timeout WRITE setTimeout NOTIFY timeoutChanged)
    Q_PROPERTY(int retries READ retries WRITE setRetries NOTIFY retriesChanged)
    Q_PROPERTY(bool state READ state WRITE setState NOTIFY stateChanged)

public:
    SerialPortItem(QObject *parent = nullptr);
    SerialPortItem(const QString &name, QObject *parent = nullptr);
    QList<DeviceRTU *> listDevice() { return this->findChildren<DeviceRTU *>(); }
    virtual ~SerialPortItem();


    const QStringList &namesProperty() const;
    int timeout() const { return m_timeout; }
    int retries() const { return m_retries; }

    bool state() const { return m_state; }

public slots:
    void setTimeout(int timeout);
    void setRetries(int retries);
    void setState(bool state);

signals:
    void timeoutChanged(int timeout);
    void retriesChanged(int retries);
    void stateChanged(bool state);

private:
    void addPropepry();
    QStringList m_namesProperty;

    int m_timeout = 1000;
    int m_retries = 3;
    bool m_state = false;
};

#endif // SERIALPORTITEM_H
