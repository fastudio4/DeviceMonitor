#ifndef DEVICERTU_H
#define DEVICERTU_H

#include <QObject>
class QModbusDataUnit;

class DeviceRTU : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString shortDesc READ shortDesc WRITE setShortDesc NOTIFY shortDescChanged)
    Q_PROPERTY(int idDevice READ idDevice WRITE setIdDevice NOTIFY idDeviceChanged)
    Q_PROPERTY(int startAddr READ startAddr WRITE setStartAddr NOTIFY startAddrChanged)
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)
    Q_PROPERTY(bool state READ state WRITE setState NOTIFY stateChanged)

    Q_PROPERTY(QStringList namesProperty READ namesProperty)
public:

    enum RegisterType {
        Invalid,
        DiscreteInputs,
        Coils,
        InputRegisters,
        HoldingRegisters
    };
    Q_ENUM(RegisterType)

    explicit DeviceRTU(QString shortDesc = "",
                       int idDevice = 2,
                       int type = Invalid,
                       int startAddr = 0,
                       int count = 0,
                       bool state = false,
                       QObject *parent = nullptr);
    virtual ~DeviceRTU();

    QString shortDesc() const { return m_shortDesc; }
    int idDevice() const { return m_idDevice; }
    int startAddr() const { return m_startAddr; }
    int count() const { return m_count; }
    bool state() const { return m_state; }

    QModbusDataUnit* dataUnit() { return unit; }
    QVector<quint16>* dataValue() { return values; }

    const QStringList &namesProperty() const { return m_namesProperty; };

public slots:
    void setShortDesc(QString shortDesc);
    void setIdDevice(int idDevice);
    void setStartAddr(int startAddr);
    void setCount(int count);
    void setState(bool state);

signals:
    void shortDescChanged(QString shortDesc);
    void idDeviceChanged(int idDevice);
    void startAddrChanged(int startAddr);
    void countChanged(int count);
    void stateChanged(bool state);

private:
    QString m_shortDesc;
    int m_idDevice;
    int m_startAddr;
    int m_count;
    bool m_state;
    QVector<quint16> *values;
    int countError;
    QString lastError;
    QModbusDataUnit *unit;

    void addPropepry();
    QStringList m_namesProperty;

};

#endif // DEVICERTU_H
