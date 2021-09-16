#include "listmodel.h"
#include <QtDebug>

ListModel::ListModel(const QStringList &roles, QObject *parent)
    : QAbstractListModel(parent)
{
    for(int i = 0; i < roles.count(); i++)
    {
        userRoles.insert(i + Qt::UserRole, roles.at(i).toUtf8());
    }
}

ListModel::~ListModel()
{

}

void ListModel::setListData(QObject *data)
{
    listObject.clear();
    listObject = data->children();
    beginResetModel();
    endResetModel();
}


int ListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return listObject.count();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()) return QVariant();
    return listObject.at(index.row())->property(userRoles.value(role).data());
}

QHash<int, QByteArray> ListModel::roleNames() const
{
    return userRoles;
}
