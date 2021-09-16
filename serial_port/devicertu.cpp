#include <QModbusDataUnit>
#include "devicertu.h"


DeviceRTU::DeviceRTU(QString shortDesc,
                     int idDevice,
                     int type,
                     int startAddr,
                     int count,
                     bool state,
                     QObject *parent)
    :QObject(parent), m_shortDesc(shortDesc), m_idDevice(idDevice),
      m_startAddr(startAddr), m_count(count), m_stateDevice(state)
{
    values = new QVector<quint16>();
    values->resize(m_count);
    unit = new QModbusDataUnit();
    switch (type) {
    case DiscreteInputs:
        unit->setRegisterType(QModbusDataUnit::DiscreteInputs);
        break;
    case Coils:
        unit->setRegisterType(QModbusDataUnit::Coils);
        break;
    case InputRegisters:
        unit->setRegisterType(QModbusDataUnit::InputRegisters);
        break;
    case HoldingRegisters:
        unit->setRegisterType(QModbusDataUnit::HoldingRegisters);
        break;
    default:
        unit->setRegisterType(QModbusDataUnit::Invalid);
    }
    unit->setStartAddress(m_startAddr);
    unit->setValueCount(m_count);
    addPropepry();
}

DeviceRTU::~DeviceRTU()
{
    delete [] values;
    values = nullptr;
    delete unit;
    unit = nullptr;
}

void DeviceRTU::setShortDesc(QString shortDesc)
{
    if (m_shortDesc == shortDesc)
        return;

    m_shortDesc = shortDesc;
    emit shortDescChanged(m_shortDesc);
}

void DeviceRTU::setIdDevice(int idDevice)
{
    if (m_idDevice == idDevice)
        return;

    m_idDevice = idDevice;
    emit idDeviceChanged(m_idDevice);
}

void DeviceRTU::setStartAddr(int startAddr)
{
    if (m_startAddr == startAddr)
        return;

    m_startAddr = startAddr;
    emit startAddrChanged(m_startAddr);
}

void DeviceRTU::setCount(int count)
{
    if (m_count == count)
        return;

    m_count = count;
    emit countChanged(m_count);
}

void DeviceRTU::setStateDevice(bool state)
{
    if (m_stateDevice == state)
        return;

    m_stateDevice = state;
    emit stateDeviceChanged(m_stateDevice);
}

void DeviceRTU::addPropepry()
{
    if(m_namesProperty.isEmpty())
    {
        m_namesProperty.append("shortDesc");
        m_namesProperty.append("idDevice");
        m_namesProperty.append("typeRegisters");
        m_namesProperty.append("startAddr");
        m_namesProperty.append("countValue");
        m_namesProperty.append("stateDevice");
        m_namesProperty.append("lastError");
        m_namesProperty.append("countError");
    }
}
