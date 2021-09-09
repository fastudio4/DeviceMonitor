#include "listports.h"
#include <QSerialPortInfo>

ListPorts::ListPorts(QObject *parent)
    : QObject(parent)
{
    ports();
}

ListPorts::~ListPorts()
{

}

QStringList ListPorts::ports()
{
    portsName.clear();
    QList<QSerialPortInfo> portsInfo = QSerialPortInfo::availablePorts();
    for (int i = 0; i < portsInfo.count(); i++)
    {
        portsName.append(portsInfo.at(i).portName());
    }
    createPorts();
    return portsName;
}

void ListPorts::portChanged(QString name)
{
    if(_ports.isEmpty()) return;
    QStringList listObj;
    for(int i = 0; i < _ports.count(); i++)
    {
        listObj.append(_ports.at(i)->portName());
    }
    emit selectPort(_ports.at(listObj.indexOf(name)));
}

QList<QObject *> ListPorts::test()
{
    QList<QObject *> test;
    for(int i = 0; i < _ports.count(); i++)
    {
//        QObject *obj = dynamic_cast<QObject *>(_ports.at(i));
        test.append(_ports.at(i));
    }
    return test;
}

void ListPorts::createPorts()
{
    if(portsName.isEmpty()) return;
    if(_ports.isEmpty())
    {
        for (int i = 0; i < portsName.count(); i++)
        {
            SerialPortItem *port = new SerialPortItem(portsName.at(i), this);
            _ports.append(port);
        }
    }
    portInList();
}

void ListPorts::portInList()
{
    if(!_ports.isEmpty() && !portsName.isEmpty())
    {
        QStringList listObj;
        for(int i = 0; i < _ports.count(); i++)
        {
            listObj.append(_ports.at(i)->portName());
        }
        for(int i = 0; i < portsName.count(); i++)
        {
            if(!listObj.contains(portsName.at(i)))
            {
                SerialPortItem *port = new SerialPortItem(portsName.at(i), this);
                _ports.append(port);
            }
        }
    }
}
