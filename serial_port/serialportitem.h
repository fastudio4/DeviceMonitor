#ifndef SERIALPORTITEM_H
#define SERIALPORTITEM_H

#include <QSerialPort>
#include "devicertu.h"

class SerialPortItem : public QSerialPort
{
    Q_OBJECT
    Q_PROPERTY(QStringList namesProperty READ namesProperty)
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(int timeout READ timeout WRITE setTimeout NOTIFY timeoutChanged)
    Q_PROPERTY(int retries READ retries WRITE setRetries NOTIFY retriesChanged)
    Q_PROPERTY(bool statePort READ statePort WRITE setStatePort NOTIFY statePortChanged)
    Q_PROPERTY(bool removed READ removed WRITE setRemoved NOTIFY removedChanged)


public:
    SerialPortItem(QObject *parent = nullptr);
    SerialPortItem(const QString &name, QObject *parent = nullptr);
    QList<DeviceRTU *> listDevice() { return this->findChildren<DeviceRTU *>(); }
    virtual ~SerialPortItem();

    enum Timeout {
        timeout500 = 500,
        timeout1000 = 1000,
        timeout1500 = 1500,
        timeout2000 = 2000,
        timeout2500 = 2500,
        timeout3000 = 3000,
        timeoutUnknown  = -1
    };
    Q_ENUM(Timeout)

    enum Retries {
        retries1 = 1,
        retries2 = 2,
        retries3 = 3,
        retries4 = 4,
        retries5 = 5,
        retriesUnknown  = -1
    };
    Q_ENUM(Retries)

    const QStringList &namesProperty() const;
    QString name();
    int timeout() const { return m_timeout; }
    int retries() const { return m_retries; }
    bool statePort() const { return m_state; }
    bool removed() const;
    void setRemoved(bool newRemoved);

public slots:
    void setTimeout(int timeout);
    void setRetries(int retries);
    void setStatePort(bool state);

signals:
    void timeoutChanged(int timeout);
    void retriesChanged(int retries);
    void statePortChanged(bool state);
    void removedChanged(bool removed);

private:
    void addPropepry();
    QStringList m_namesProperty;
    QString m_name;
    int m_timeout = 1000;
    int m_retries = 3;
    bool m_state = true;
    bool m_removed = false;


};

#endif // SERIALPORTITEM_H
