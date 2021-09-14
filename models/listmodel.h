#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QAbstractListModel>

class ListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ListModel(QObject *parent = nullptr);
    virtual ~ListModel();

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

public slots:
    void setListData(QObject *data, const QStringList &roles);
    void update(bool test);
private:
    QList<QObject*> listObject;
    QHash<int, QByteArray> userRoles;
};

#endif // LISTMODEL_H
