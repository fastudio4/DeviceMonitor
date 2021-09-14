#include "listmodel.h"
#include <QtDebug>

ListModel::ListModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

ListModel::~ListModel()
{

}

void ListModel::setListData(QObject *data, const QStringList &roles)
{
//    beginResetModel();
    listObject.clear();
    userRoles.clear();

    listObject = data->children();

    for(int i = 0; i < roles.count(); i++)
    {
        userRoles.insert(i + Qt::UserRole, roles.at(i).toUtf8());
    }
    endResetModel();
}

void ListModel::update(bool test)
{

    emit dataChanged(QModelIndex(), QModelIndex());
    qDebug() << test;
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
