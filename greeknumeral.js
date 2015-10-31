// Copyright: 2015 (C) SAKAMOTO Noriaki.
// Licenced under GPL-3 or later.

// var bigInt = require("big-integer");

var numeralSign = String.fromCharCode(884);
var lowerNumeralSign = String.fromCharCode(885);
var M = String.fromCharCode(924);

var digitsArray = new Array(
    ["", "α", "β", "γ", "δ", "ε", "ϛ", "ζ", "η", "θ"],
    ["", "ι", "κ", "λ", "μ", "ν", "ξ", "ο", "π", "ϙ"],
    ["", "ρ", "σ", "τ", "υ", "φ", "χ", "ψ", "ω", "ϡ"]
);


digitsArray[3] = digitsArray[0].map(function(str){return lowerNumeralSign + str;});
digitsArray[3][0] = "";

function upToMyriad(n) {
    if (n.lesser(0) || n.greater(10000)) {
        return "too big";
    }
    var i;
    var str="";
    for (i = 0; i < 4; i++) {
        var divmod = n.divmod(10);
        var d = divmod.remainder.valueOf();
        n = divmod.quotient;
        str = digitsArray[i][d] + str;
    }
    return str;
}

function addNumeralSign(str) {
    if (str == "") {
        return str;
    } else {
        return str + numeralSign;
    }
}

function splitMyriad(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    var arr = [];
    while (n.greater(0)) {
        var divmod = n.divmod(10000);
        var r = divmod.remainder;
        n = divmod.quotient;
        arr.push(r);
    }
    return arr;
}

function convertUpToMyriad(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    if (n.lesser(0) || n.greater(10000)) {
        return "too big";
    }
    return addNumeralSign(upToMyriad(n));
}

function convertCommon(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    if (n.lesser(0) || n.greater(100000000)) {
        return "too big";
    }
    return convertAristarchusA(n);
}

function convertModern(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    if (n.lesser(0) || n.greater(10000)) {
        return "too big";
    }
    return addNumeralSign(upToMyriad(n));
}

function AristarchusBExponent(n) {
    if (n < 0) {
        return "negative";
    } else {
        var str = "";
        for (; n > 0; n--) {
            str += M;
        }
        return str;
    }
}

function AristarchusBMyriad(n, i) {
    if (n.greater(0)) {
        return convertUpToMyriad(n) + AristarchusBExponent(i);
    } else {
        return "";
    }
}

function ApolloniusAMyriad(n, i, e, comma) {
    if (n.lesser(0)) {
        return "negative";
    } else if (n.equals(0)) {
        return "";
    } else if (i.greater(0)) {
        return convertApolloniusSub(i, e+1, comma) + M + upToMyriad(n);
    } else {
        return upToMyriad(n);
    }
}

function convertApolloniusSub(n, e, comma) {
    if (n.lesser(0)) {
        return "negative";
    }

    var myriad = function (n, i) {
        return ApolloniusAMyriad(n, bigInt(i), e, comma);
    };

    var sep = comma;
    for (var i = 0; i < e; i++) {
        sep = numeralSign + sep;
    }

    var isNonemptyStr = function (str) {
        return !(str === "");
    }

    return splitMyriad(n).map(myriad).filter(isNonemptyStr).reverse().join(sep);
}

function convertApolloniusA(n, e) {
    if (typeof e === 'undefined') { e = 1; }

    return addNumeralSign(convertApolloniusSub(n, e, ","));
}

function convertApolloniusB(n, e) {
    if (typeof e === 'undefined') { e = 1; }

    return addNumeralSign(convertApolloniusSub(n, e, ""));
}

function convertApolloniusC(n, e) {
    if (typeof e === 'undefined') { e = 1; }

    return addNumeralSign(convertApolloniusSub(n, e, " καὶ "));
}

function convertDiophantus(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    return splitMyriad(n).map(convertUpToMyriad).reverse().join(".");
}

function convertAristarchusA(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    return splitMyriad(n).map(convertUpToMyriad).reverse().join(M);
}

function convertAristarchusB(n) {
    if (n.lesser(0)) {
        return "negative";
    }
    return splitMyriad(n).map(AristarchusBMyriad).reverse().join("");
}

function convert() {
    // document.theForm.reset();
    var numString = document.theForm.theNumber.value;
    var num = bigInt(numString);
    document.theForm.normal.value = convertCommon(num);
    document.theForm.Diophantus.value = convertDiophantus(num);
    document.theForm.Aristarchus.value = convertAristarchusA(num);
//    document.theForm.AristarchusA.value = convertAristarchusA(num);
//    document.theForm.AristarchusB.value = convertAristarchusB(num);
    document.theForm.ApolloniusA.value = convertApolloniusA(num);
    document.theForm.ApolloniusB.value = convertApolloniusB(num);
    document.theForm.ApolloniusC.value = convertApolloniusC(num);
}
function inc(n) {
    var numString = document.theForm.theNumber.value;
    var num = bigInt(numString);
    document.theForm.theNumber.value = num + bigInt(n);
    convert();
}
function rst() {
    document.theForm.reset();
}
// vim: set et fenc=utf-8 ff=unix sts=0 sw=4 ts=4 :
