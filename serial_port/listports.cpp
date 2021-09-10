#include "listports.h"
#include <QSerialPortInfo>
#include <QDebug>

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
//    qDebug() << _ports.at(listObj.indexOf(name));
    emit selectPort(_ports.at(listObj.indexOf(name)));
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
        QStringList tmpListPorts;
        QStringList tmpRemovedPorts;
        for(int i = 0; i < _ports.count(); i++)
        {
            tmpListPorts.append(_ports.at(i)->portName());
        }
        for(int i = 0; i < portsName.count(); i++)
        {
            if(!tmpListPorts.contains(portsName.at(i)))
            {
                SerialPortItem *port = new SerialPortItem(portsName.at(i), this);
                _ports.append(port);
            }
        }
        if(tmpListPorts.count() > portsName.count())
        {
            tmpRemovedPorts = tmpListPorts;
            for(int i = 0; i < portsName.count(); i++)
            {
                tmpRemovedPorts.removeOne(portsName.at(i));
            }
            oflinePorts(tmpRemovedPorts);
        }

    }
}
void ListPorts::oflinePorts(const QStringList &ports)
{
    if(!ports.isEmpty())
    {
        for(int i = 0; i < _ports.count(); i++)
        {
            if(ports.contains(_ports.at(i)->portName()))
            {
                _ports.at(i)->setRemoved(true);
            }
            else {
                _ports.at(i)->setRemoved(false);
            }
        }
    }
}
