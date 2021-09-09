#include "listmodel.h"
#include <QDebug>


ListModel::ListModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

ListModel::~ListModel()
{

}

void ListModel::setListData(const QList<QObject*> &data, const QStringList &roles)
{
    listObject.clear();
    userRoles.clear();
    listObject = data;
//    beginResetModel();
    for(int i = 0; i < roles.count(); i++)
    {
        userRoles.insert(i+Qt::UserRole, roles.at(i).toUtf8());
    }

//    endResetModel();
}

int ListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return listObject.count();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()) return QVariant();
//    qDebug() << listObject.at(index.row())->property(userRoles.value(role).data());
    return listObject.at(index.row())->property(userRoles.value(role).data());
}

QHash<int, QByteArray> ListModel::roleNames() const
{
    return userRoles;
}
