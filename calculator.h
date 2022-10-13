#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <map>
#include <string>
#include <QDebug>
#include <QString>
#include <stack>
#include <sstream>
#include <iostream>
#include <vector>
#include <stdexcept>
#include <regex>

namespace clc {
    static std::map<std::string, double (*)(double a, double b)> ops {
        { "+", [] (double a, double b) { return a + b; } },
        { "-", [] (double a, double b) { return a - b; } },
        { "*", [] (double a, double b) { return a * b; } },
        { "/", [] (double a, double b) { return a / b; } },
        { "%", [] (double a, double b) { return (a / 100) * b; } },
    };

    class calculator : public QObject {
        Q_OBJECT
    public:
        explicit calculator(QObject *parent = nullptr);

        double getRes(void) const;
    signals:
        void valueChngd();
    public slots:
        void clearSlt() {
            this->operation_.clear();
            this->parsed_.clear();
            this->res_ = 0.0;
        }

        void equalSlt(const QString &msg) {
            this->operation_ = msg.toStdString();
            if(this->parseOp()) {
                this->res_ = this->evlRpn();
                emit this->valueChngd();
            } else {
                this->res_ = 0.0;
                emit this->valueChngd();
            }
        }
    private:
        bool isNumeric(std::string const &str);

        bool parseOp(void);

        double evlRpn();

        double                   res_;
        std::string              operation_;
        std::vector<std::string> parsed_;
    };

}   //clc
#endif // CALCULATOR_H
