'use strict';

exports._map = function(f) {
    return function(a) {
        return function(cb) {
            a(function(x) {
                cb(f(x));
            });
        };
    };
};

exports._apply = function(f) {
    return function(a) {
        return function(cb) {
            f(function(f_) {
                a(function(x) {
                    cb(f_(x));
                });
            });
        };
    };
};

exports._pure = function(x) {
    return function(cb) {
        cb(x);
    };
};

exports._bind = function(a) {
    return function(k) {
        return function(cb) {
            a(function(x) {
                k(x)(cb);
            });
        };
    };
};

exports._liftEff = function(a) {
    return function(cb) {
        cb(a());
    };
};

exports._launchIff = function(a) {
    return function() {
        a(function() {});
    };
};

exports._forkIff = function(a) {
    return function(cb) {
        cb(null);
        a(function() {});
    };
};
