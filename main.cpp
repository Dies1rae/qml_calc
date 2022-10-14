#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <iostream>
#include <string>

#include "calculator.h"

using namespace clc;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    calculator calcEnj;

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/fun/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *root = qobject_cast<QQuickWindow*>(engine.rootObjects().value(0));

    QObject *btnTotal = root->findChild<QObject*>("total");
    QObject *btnClr = root->findChild<QObject*>("clear");
    QObject *mainDisp = root->findChild<QObject*>("maintxt");

    QObject::connect(btnTotal, SIGNAL(totalClicked(QString)),
                       &calcEnj, SLOT(equalSlt(QString)));
    QObject::connect(btnClr, SIGNAL(totalCleared()),
                       &calcEnj, SLOT(clearSlt()));

    QObject::connect(&calcEnj, &calculator::valueChngd, [&] () {
        std::string tmp = std::to_string(calcEnj.getRes());
        mainDisp->setProperty("text", {QString::fromStdString(tmp)});
    });


    return app.exec();
}
