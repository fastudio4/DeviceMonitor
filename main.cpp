#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>

#include <QDebug>
#include "serial_port/serialportitem.h"
#include "models/listmodel.h"
#include "serial_port/listports.h"
#include "models/propertylistmodel.h"
#include "serial_port/listdevices.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QStringList portsPropperty;
    portsPropperty << "portName" << "statePort" << "removed";

    QStringList devisesPropperty;
    devisesPropperty << "shortDesc" << "idDevice" << "stateDevice";

    SerialPortItem emptyPort(&engine);
    ListPorts ports(&engine);
    ListDevices devOnPort(&engine);

    ListModel portModel(portsPropperty,&engine);
    ListModel devicesModel(devisesPropperty,&engine);
    PropertyListModel propertyModel(&engine);
    propertyModel.setDataModel(&emptyPort);

    portModel.setListData(&ports);

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("ports", &ports);
    context->setContextProperty("portsList", &portModel);
    context->setContextProperty("deviceList", &devOnPort);
    context->setContextProperty("portSettings", &propertyModel);
    context->setContextProperty("devicesSettings", &devicesModel);
    QObject::connect(&ports, SIGNAL(selectPort(QObject *)), &propertyModel, SLOT(setDataModel(QObject *)));
    QObject::connect(&ports, SIGNAL(updateData(QObject *)), &portModel, SLOT(setListData(QObject *)));
    QObject::connect(&ports, SIGNAL(updateData(QObject * )), &devicesModel, SLOT(setListData(QObject *)));
    QObject::connect(&devOnPort, SIGNAL(newDevice(QString)), &ports, SLOT(objPort(QString)));
    QObject::connect(&ports, SIGNAL(newDev(QObject * )), &devOnPort, SLOT(parentDevice(QObject *)));


    engine.load(url);

    return app.exec();
}


