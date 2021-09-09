#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QAbstractListModel>

class ListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ListModel(QObject *parent = nullptr);
    virtual ~ListModel();

    void setListData(const QList<QObject*> &data, const QStringList &roles);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;
private:
    QList<QObject*> listObject;
    QHash<int, QByteArray> userRoles;
};

#endif // LISTMODEL_H
