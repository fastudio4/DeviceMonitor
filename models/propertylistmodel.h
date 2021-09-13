#ifndef PROPERTYLISTMODEL_H
#define PROPERTYLISTMODEL_H


#include <QAbstractListModel>
#include <QMetaProperty>
#include <QVariantMap>

class PropertyListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QStringList propertyList READ propertyList)
public:
    PropertyListModel(QObject *parent = nullptr);
    virtual ~PropertyListModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);

    const QStringList &propertyList() const;
    QHash<int, QByteArray> roleNames() const;



public slots:
    void setDataModel(QObject *data, QString nameProperty = "namesProperty");
    Q_INVOKABLE QList<QVariant> enums(QString nameEnums);


private:
    void createRoles();
    QObject *pData;
    QStringList m_propertyList;
    QHash<int, QByteArray> userRoles;
    QMap<QString, QMetaEnum> enumsList;
    QList<QVariant> m_enums;
    QVector<int> rolesInt;
};

#endif // PROPERTYLISTMODEL_H
