#include "listmodel.h"
#include <QDebug>


ListModel::ListModel(QObject *parent)
    : QAbstractListModel(parent)
{
//    qDebug() << "Start";
}

ListModel::~ListModel()
{

}

void ListModel::setListData(QObject *data, const QStringList &roles)
{
//    qDebug() << "Start";
    listObject.clear();
    userRoles.clear();
    listObject = data->children();
//    qDebug() << listObject;
    beginResetModel();
    for(int i = 0; i < roles.count(); i++)
    {
        userRoles.insert(i + Qt::UserRole, roles.at(i).toUtf8());
    }
    endResetModel();
}

int ListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
//    qDebug() << listObject.count();
    return listObject.count();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()) return QVariant();
//    qDebug() << listObject.at(index.row())->property("portName");
//    qDebug() << userRoles.value(role).data();
//    qDebug() << listObject.at(index.row())->property(userRoles.value(role).data());
    return listObject.at(index.row())->property(userRoles.value(role).data());
}

QHash<int, QByteArray> ListModel::roleNames() const
{
//    qDebug() << userRoles;
    return userRoles;
}
