#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>

#include <QDebug>
#include "models/listmodel.h"
#include "serial_port/listports.h"

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

    ListPorts ports(&engine);
    ListModel listModel(&engine); //tests
    listModel.setListData(ports.test(), QStringList("portName")); //tests
    QQmlContext *context = engine.rootContext();
//    context->setContextProperty("ports", &ports);
    context->setContextProperty("portList", &listModel);


    engine.load(url);

    return app.exec();
}


