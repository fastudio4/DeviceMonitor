#include "listmodel.h"

ListModel::ListModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

ListModel::~ListModel()
{

}

void ListModel::setListData(QObject *data, const QStringList &roles)
{
    listObject.clear();
    userRoles.clear();
    beginResetModel();
    listObject = data->children();
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
