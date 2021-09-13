#include "serialportitem.h"
#include <QVariant>

SerialPortItem::SerialPortItem(QObject *parent)
    :QSerialPort(parent)
{
    addPropepry();
    QString nameProp = "portName";
    setProperty("portName", nameProp);
    m_portName = "empty";
}

SerialPortItem::SerialPortItem(const QString &name, QObject *parent)
    :QSerialPort(name, parent)
{
    addPropepry();
    setProperty("portName", name);
    m_portName = portName();
}

SerialPortItem::~SerialPortItem()
{

}

const QStringList &SerialPortItem::namesProperty() const
{
    return m_namesProperty;
}

void SerialPortItem::setTimeout(int timeout)
{
    if (m_timeout == timeout)
        return;

    m_timeout = timeout;
    emit timeoutChanged(m_timeout);
}

void SerialPortItem::setRetries(int retries)
{
    if (m_retries == retries)
        return;

    m_retries = retries;
    emit retriesChanged(m_retries);
}

void SerialPortItem::setState(bool state)
{
    if (m_state == state)
        return;

    m_state = state;
    emit stateChanged(m_state);
}

void SerialPortItem::addPropepry()
{
    if(m_namesProperty.isEmpty())
    {
        m_namesProperty.append("portName");
        m_namesProperty.append("baudRate");
        m_namesProperty.append("dataBits");
        m_namesProperty.append("stopBits");
        m_namesProperty.append("parity");
        m_namesProperty.append("flowControl");
        m_namesProperty.append("timeout");
        m_namesProperty.append("retries");
        m_namesProperty.append("state");
        m_namesProperty.append("removed");
    }
}

bool SerialPortItem::removed() const
{
    return m_removed;
}

void SerialPortItem::setRemoved(bool newRemoved)
{
    if (m_removed == newRemoved)
        return;
    m_removed = newRemoved;
    emit removedChanged();
}

const QString &SerialPortItem::portName() const
{
    return m_portName;
}
