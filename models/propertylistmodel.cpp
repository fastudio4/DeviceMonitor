#include "propertylistmodel.h"
#include <QMetaProperty>


PropertyListModel::PropertyListModel(QObject *parent)
    :QAbstractListModel(parent)
{

}
PropertyListModel::~PropertyListModel()
{

}

void PropertyListModel::setDataModel(QObject *data, QString nameProperty)
{
    pData = data;
    beginResetModel();
    m_propertyList.clear();
    userRoles.clear();
    enumsList.clear();
    rolesInt.clear();
    QByteArray bt = nameProperty.toLocal8Bit();
    const char *c_property = bt.data();
    m_propertyList = pData->property(c_property).toStringList();
    for(int i = 0; i < m_propertyList.count(); i++)
    {
        userRoles.insert(Qt::UserRole + i, m_propertyList.at(i).toUtf8());
        rolesInt.append(Qt::UserRole + i);
    }
    const QMetaObject *metaobject = pData->metaObject();
    int count = metaobject->enumeratorCount();
    for (int i = 0; i < count; ++i)
    {
        QMetaEnum enums = metaobject->enumerator(i);
        QString nameEnums = QString(enums.name());
        if(m_propertyList.contains(nameEnums.replace(0,1,nameEnums.at(0).toLower())))
            enumsList.insert(enums.name(), enums);
    }
    endResetModel();
}

int PropertyListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return 1;
}

QVariant PropertyListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) return QVariant();
    if(userRoles.contains(role))
    {
        return pData->property(userRoles.value(role).data());
    }

    return QVariant();
}

bool PropertyListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    Q_UNUSED(index)
    Q_UNUSED(role)
    QString nameProperty = value.toString().split("|").at(0);
    int data = value.toString().split("|").at(1).toUInt();
    QByteArray bt = nameProperty.toLocal8Bit();
    const char *c_property = bt.data();
    if(pData->setProperty(c_property, data)) {
        emit dataChanged(QModelIndex(), QModelIndex(), rolesInt);
        return true;
    }
    return false;
}

QHash<int, QByteArray> PropertyListModel::roleNames() const
{
    return userRoles;
}

const QStringList &PropertyListModel::propertyList() const
{
    return m_propertyList;
}

QList<QVariant> PropertyListModel::enums(QString nameEnums)
{
    m_enums.clear();
    if(enumsList.contains(nameEnums)) {
        QMetaEnum enumData = enumsList.value(nameEnums);
        for(int i = 0; i < enumData.keyCount()-1; i++)
        {
            m_enums.append(enumData.value(i));
        }
    }
    return m_enums;
}
