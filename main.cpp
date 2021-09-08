#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QSerialPortInfo>
#include <QDebug>
#include <QObject>
#include "models/listmodel.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qDebug() << "engine";
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QList<QObject> objList;
    QList<QSerialPortInfo> portsInfo = QSerialPortInfo::availablePorts();
    for (int i = 0; i < portsInfo.count(); i++)
    {
        QObject obj;
        obj.setProperty("portName", portsInfo.at(i).portName());
        objList.append(obj);
        qDebug() << obj.property("portName");
    }
    ListModel listModel; //tests
    qDebug() << "Create model";
    listModel.setListData(objList, QStringList("portName")); //tests
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("portList", &listModel);

    engine.load(url);

    return app.exec();
}


