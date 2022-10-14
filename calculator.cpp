#include "calculator.h"

namespace clc {
    calculator::calculator(QObject *parent)
        : QObject{parent}
    {}

    bool calculator::isNumeric(std::string const &str) {
        return std::regex_match(str, std::regex("^(([0-9]*)|(([0-9]*)\\.([0-9]*)))"));
    }

    bool calculator::parseOp(void) {
        this->parsed_.clear();
        std::string tmp;
        for(const auto& ch : this->operation_) {
            if(ch != 32) {
                tmp += ch;
            } else {
                parsed_.push_back(tmp);
                tmp.clear();
            }
        }
        parsed_.push_back(tmp);
        return !parsed_.empty();
    }

    double calculator::evlRpn() {
        std::stack<double> stc;
        auto pop_stc( [&] () {
            auto res (stc.top());
            stc.pop();
            return res;
        } );
        std::string op;
        for(auto ptr = this->parsed_.begin(); ptr != this->parsed_.end(); ++ptr) {
            std::stringstream ss {*ptr};
            double value;
            if(isNumeric(ss.str())) {
                ss >> value;
                stc.push(value);
                if(stc.size() >= 2 && !op.empty()) {
                    const auto r {pop_stc()};
                    const auto l {pop_stc()};
                    try {
                        const auto & oper (ops.at(op));
                        const double result {oper(l, r)};
                        stc.push(result);
                    } catch (...) {
                        throw std::invalid_argument(*ptr);
                    }
                }
            } else {
                op.clear();
                ss >> op;
            }
        }
        return stc.top();
    }

    double calculator::getRes(void) const {
        return this->res_;
    }
}   //clc
