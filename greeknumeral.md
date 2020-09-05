---
title: Comprehensive Ancient Greek Number Converter
mathjax: on
---

---
author: SAKAMOTO Noriaki (\@na4zagin3)
date: 2020-09-06
...

Source code at GitHub [na4zagin3/elm-grcnum](https://github.com/na4zagin3/elm-grcnum).

# Converter
<script src="elm.min.js"></script>
<div id="elm"></div>
<script>
var translations =
  { extended: " (extended)"
  , tooBig: "unsupported"
  , inputIn: "Input in "
  , numberToConvert: "Number to convert"
  , convertFrom: "Converted from"
  , decimalButton: "decimal"
  , decimalFormat: "Input a number without separators. E.g., 1234"
  , fractionButton: "fraction"
  , fractionFormat: "Input a fraction or a series of unit fractions. E.g., 355/113 or 1/2+1/3+1/5"
  , sexagesimalButton: "sexagesimal"
  , sexagesimalFormat: "Input in modern sexagesimal notation. E.g., 12;34,5 (meaning 12°34′5″)"

  , experimentalNote: "* Experimental"

  , cardinalSingMascDesc:
        { href: "#cardinal"
        , label: "Cardinal (nominative masculine form, descending order)*"
        }
  , adverbial:
        { href: "#adverbial"
        , label: "Adverbial*"
        }
  , attic: 
        { href: "#attic"
        , label: "Attic"
        }
  , commonIonian: 
        { href: "#common-ionian"
        , label: "Common Ionian"
        }
  , diophantus: 
        { href: "#diophantus"
        , label: "Diophantus"
        }
  , aristarchus: 
        { href: "#aristarchus"
        , label: "Aristarchus"
        }
  , apollonius: 
        { href: "#apollonius"
        , label: "Apollonius"
        }
  , modifiedApollonius: 
        { href: "#modified-apollonius"
        , label: "Modified Apollonius"
        }

  , fracDiophantus:
        { href: "#fraction-diophantus"
        , label: "Diophantus"
        }
  , fracHeron:
        { href: "#fraction-heron"
        , label: "Heron"
        }
  , sexagesimalTriple: 
        { href: null
        , label: "Sexagesimal triple"
        }
  , sexagesimal: 
        { href: "#sexagesimal"
        , label: "Sexagesimal (EXPERIMENTAL)"
        }
  , sexagesimalPtolemy: 
        { href: "#sexagesimal-ptolemy"
        , label: "Sexagesimal Ptolemy (EXPERIMENTAL)"
        }
  }

var app = Elm.Main.init({
  node: document.getElementById('elm'),
  flags: {
    translations: translations
  }
});
</script>

Inspired from Russell Cottrell’s [Greek Number Converter](http://www.russellcottrell.com/greek/utilities/GreekNumberConverter.htm).

This document is to provide reliable information and interactive converters of Ancient Greek number systems with proper citations.
Currently, it is difficult to find correct information about Ancient Greek number systems in the Internet. For example, Harry Foundalis’ [_Greek Numbers and Numerals (Ancient and Modern)_](https://www.foundalis.com/lan/grknum.htm) contains comprehensive description about Modern Greek, but the section about Ancient Greek contains several problems—he insists that Archimedes (287–212 BCE) came up with numerals greater than 1,0000, while Herodotus (484–425 BCE) and others before Archimedes, in fact, casually used δισμύριοι 2,0000 and so on: “ἄνδρες τετρακισχίλιοι καὶ δισμύριοι γίνονται.”—Herodotus _Historia_ 7.185.1. John J O’Connor and Edmund F Robertson’s [_Greek Number Systems_](http://www-history.mcs.st-and.ac.uk/HistTopics/Greek_numbers.html) clearly shows they could not read either Ancient or Modern Greek or could not consult people having studied Classics.  Russell Cottrell’s The Greek Number Converter is confusing people—an author of article ギリシアの数字 “Greek Numerals” in Wikipedia.ja misunderstood that the method Russell Cottrell invented was actually used by Ancient Greeks.

# Notations
In this document, I use myriad (meaning _ten-thousand_) separators (e.g., 1234,5678,9012) rather than thousand separators (e.g., 123,456,789,012).
That is because Ancient Greek numerals are, like Chinese and Japanese, based on ten thousand—therefore 20,0000 or 200,000 is expressed as _twenty ten-thousand_ (εἴκωσι μυριάδες) rather than _two hundred thousand_ (διακόσιοι χίλιοι).
Ancient Greeks also used sexagesimal systems, or base-60 system, by influence of Mesopotamian mathematics. 
For sexagesimal notations, I write 12°34′56″7‴8⁗ for degrees (360 degrees = 1 turn), 12^p^34′56″7‴8⁗ for segments (120 segments = 1 diameter; “p” stands for _partes_ “parts”), and modern notation like 1,2;3,4  for general sexagesimal fractions.
In modern sexagesimal notation, “,” is a sexagesimal separator and “;” is followed by a fraction part. Therefore $\text{1,2;3,4} = 1 \times 60 + 2 + \frac{3}{60} + \frac{4}{60^2}$.

Throughout the document Greek texts lowercase and uppercase letters are distinguished (e.g., μ vs. Μ) for readability and to follow modern printing conventions. That distinction _did not exist_ in Ancient Greek; minuscule script was invented in 9th century [@Irigoin1996, p.69].

# Systems
## Numerals
In every language numerals has existed before invention of writings, including alphabets and numbers. Therefore I firstly introduce numerals. For simplicity, I only refer Attic dialect, which was one of the major dialects of Ancient Greek and had been considered the norm of written language until Modern Greek took in place. Please see cited books if you are interested in other dialects. Therefore the geminated consonant “ττ” appears instead of “σσ” in Ionic dialect and Koiné Greek. E.g., τέτταρες instead of τέσσαρες.

The below Attic Greek numerals are based on a table listed in [@Smyth1920, §347].
Cardinal numbers are _one,_ _two,_ _three_ and so on; ordinal numbers are _first,_ _second,_ _third_ and so on; and adverbial numbers are _once,_ _twice,_ _thrice_ and so on. Since Greek has declension---an adjective changes their form depending on gender, number, and case---two or three forms in nominative case may be shown in each cardinal number or ordinal number field.

|  Number | Cardinal                                | Ordinal                 | Adverbial          |
|--------:|:----------------------------------------|:------------------------|:-------------------|
|       1 | εἷς, μία, ἕν _one_                      | πρῶτος, -η, -ον _first_ | ἅπαξ _once_        |
|       2 | δύο _two_                               | δεύτερος _second_       | δίς _twice_        |
|       3 | τρεῖς, τρία _three_                     | τρίτος _third_          | τρίς _trice_       |
|       4 | τέτταρες, τέτταρα                       | τέταρτος                | τετράκις           |
|       5 | πέντε                                   | πέμπτος                 | πεντάκις           |
|       6 | ἕξ                                      | ἕκτος                   | ἕξάκις             |
|       7 | ἑπτά                                    | ἕβδομος                 | ἑπτάκις            |
|       8 | ὀκτώ                                    | ὄγδοος                  | ὀκτάκις            |
|       9 | ἐννέα                                   | ἔνατος                  | ἐνάκις             |
|      10 | δέκα                                    | δέκατος, -η, -ον        | δεκάκις            |
|      11 | ἕνδεκα                                  | ἑνδέκατος               | ἑνδεκάκις          |
|      12 | δώδεκα                                  | δωδέκατος               | δωδεκάκις          |
|      13 | τρεῖς (τρία) καὶ δέκα (or τρεισκαίδεκα) | τρίτος καὶ δέκατος      | τρεισκαιδεκάκις    |
|      14 | τέτταρες (τέτταρα) καὶ δέκα             | τέταρτος καὶ δέκατος    | τετταρεσκαιδεκάκις |
|      15 | πεντεκαίδεκα                            | πέμπτος καὶ δέκατος     | πεντεκαιδεκάκις    |
|      16 | ἑκκαίδεκα                               | ἕκτος καὶ δέκατος       | ἑκκαιδεκάκις       |
|      17 | ἑπτακαίδεκα                             | ἕβδομος καὶ δέκατος     | ἑπτακαιδεκάκις     |
|      18 | ὀκτωκαίδεκα                             | ὄγδοος καὶ δέκατος      | ὀκτωκαιδεκάκις     |
|      19 | ἐννεακαίδεκα                            | ἔνατος καὶ δέκατος      | ἐννεακαιδεκάκις    |
|      20 | εἴκοσι(ν)                               | εἰκοστός, -ή, -όν       | εἰκοσάκις          |
|      21 | εἷς καὶ εἴκοσι(ν) or εἴκοσι (καὶ) εἷς   | πρῶτος καὶ εἰκοστός     | εἰκοσάκις ἅπαξ     |
|      30 | τριᾱ́κοντα                               | τριᾱκοστός              | τριᾱκοντάκις       |
|      40 | τετταράκοντα                            | τετταρακοστός           | τετταρακοστάκις    |
|      50 | πεντήκοντα                              | πεντηκοστός             | πεντηκοντάκις      |
|      60 | ἑξήκοντα                                | ἑξηκοστός               | ἑξηκοντάκις        |
|      70 | ἑβδομήκοντα                             | ἑβδομηκοστός            | ἑβδομηκοντάκις     |
|      80 | ὀγδοήκοντα                              | ὀγδοηκοστός             | ὀγδοηκοντάκις      |
|      90 | ένενήκοντα                              | ἐνενηκοστός             | ἐνενηκοντάκις      |
|     100 | ἑκατόν                                  | ἑκατοστός, -ή, -όν      | ἑκατοντάκις        |
|     200 | διᾱκόσιοι, -αι, -α                      | διᾱκοσιοστός            | διᾱκοσιάκις        |
|     300 | τριᾱκόσιοι                              | τριᾱκοσιοστός           | τριᾱκοσιάκις       |
|     400 | τετρακόσιοι                             | τετρακοσιοστός          | τετρακοσιάκις      |
|     500 | πεντακόσιοι                             | πεντακοσιοστός          | πεντακοσιάκις      |
|     600 | ἑξακόσιοι                               | ἑξακοσιοστός            | ἑξακοσιάκις        |
|     700 | ἑπτακόσιοι                              | ἑπτακοσιοστός           | ἑπτακοσιάκις       |
|     800 | ὀκτακόσιοι                              | ὀκτακοσιοστός           | ὀκτακοσιάκις       |
|     900 | ἐνακόσιοι                               | ἐνακοσιοστός            | ἐνακοσιάκις        |
|    1000 | χῑ́λιοι, -αι, -α                         | χιλῑστός, -ή, -όν       | χῑλιάκις           |
|    2000 | δισχῑ́λιοι                               | δισχῑλιοστός            | δισχῑλιάκις        |
|    3000 | τρισχῑ́λιοι                              | τρισχῑλιοστός           | τρισχῑλιάκις       |
|  1,0000 | μῡ́ριοι, -αι, -α                         | μῡριοστός               | μῡριάκις           |
|  2,0000 | δισμῡ́ριοι δύο μυριάδες                  | δισμῡριοστός            | δισμῡριάκις        |
| 10,0000 | δεκακισμῡ́ριοι                           | δεκακισμῡριοστός        | δεκακισμῡριάκις         |


### Cardinal
This section is based on [@Smyth1920, §§347,349--350].

Only numerals 1, 2, 3, 4, and numerals ending with -κόσιοι, -χῑ́λιοι, and μῡ́ριοι, are declinable as a first–second declension adjective. In other words, single word numerals 5 to 199 are undeclinable [@Smyth1920, §§350].

In Attic dialect, 13 and 14 are represented by compound numbers rather than compound words; thus τρεῖς καὶ δέκα “three and ten” and τέτταρες καὶ δέκα “four and ten” rather than τρεισκαίδεκα “three-and-ten” and τετταρεσκαίδεκα “four-and-ten”, respectively.

εἴκοσι(ν) 20 has a [movable nu](https://en.wikipedia.org/wiki/Movable_nu), which appears as εἴκοσι or εἴκοσιν.

Word order usually appears in one of the following three formats:

- Ascending order with conjunction: _ones_ καὶ _tens_ καὶ _hundreds_ καὶ _thousands_
- Descending order with conjunction: _thousands_ καὶ _hundreds_ καὶ _tens_ καὶ _ones_
- Descending order without conjunction: _thousands_ _hundreds_ _tens_ _ones_

#### Common systems for numbers greater than 9999
In this section, all emphases and quoted translations to Greek texts are mine.

There are two kinds of numerals to represent numbers greater than 9999. Here I call them _n_-κισμύριοι “_n_-times-ten-thousand” system and _n_ μυριάδες “_n_ ten-thousands” system.

- _n_-κισμύριοι system: A compound word of adverbial form and μύριοι (meaning 1,0000)
    - τῶν **δισμυρίων** (2,0000 gen.) Polyb.Hist.1.29.7 
    - εἰς **δισμυρίους ὀκτακισχιλίους** (2,8000 acc.) Polyb.Hist.2.65.5
    - **μυρίους χιλίους ὀκτακοσίους πεντήκοντα** (1,1850 acc.) Polyb.Hist.3.33.16
    - ὑπὲρ τοὺς **ἑξακισχιλίους καὶ μυρίους** (1,6000 acc.) σταδίους. Polyb.Hist.3.39.3
    - **πεντηκοντακισμυρίους καὶ τετρακισμυρίους** (54,0000 acc.). Polyb.Hist.21.43.19
- _n_ μυριάδες system: A cardinal number and μυριάδες (meaning 1,0000)
    - **δύο μυριάδας** (2,0000 acc), Polyb.Hist.2.65.7
    - **πέντε μυριάδων** (5,0000 gen.) Polyb.Hist.1.18.7
    - ὑπὲρ **πεντεκαίδεκα μυριάδας** (15,0000 acc.) Polyb.Hist.1.26.8
    - περὶ **τέτταρας καὶ δέκα μυριάδας** (14,0000 acc.) Polyb.Hist.1.26.7
    - ἡ πληθὺς πεζῶν μὲν εἰς **εἴκοσι καὶ πέντε** κατελέχθησαν **μυριάδες** (25,0000), ἱππέων δ᾽ ἐπὶ ταῖς **δύο μυριάσιν** ἐπῆσαν ἔτι **τρεῖς χιλιάδες** (2,3000). Polyb.Hist.2.24.14

Both system were even used in the same sentence. For example,
πεζῶν μὲν ἔχων εἰς **ἐννέα μυριάδας** (9,0000 acc.), ἱππεῖς δὲ περὶ **μυρίους καὶ δισχιλίους** (1,2000 acc.).
Polyb.Hist.3.35.1

Generally speaking, _n_-κισμύριοι system is limited for smaller numbers namely $n \le 7$. A notable exception is Polybius’s
πεντηκοντακισμυρίους καὶ τετρακισμυρίους Polyb.Hist.21.43.19, representing 54,0000.
On the other hand, _n_ μυριάδες system can be used for bigger numbers. Especially, mathematical documents prefer _n_ μυριάδες system over _n_-κισμύριοι system.


### Ordinal
This section is based on [@Smyth1920, §§347].

[@Smyth1920, §§350b] writes

> For 21st, 31st, etc., εἷς (for πρῶτος) καὶ εἰκοστός (τριᾱκοστός) is permissible, but otherwise the cardinal is rarely thus joined with the ordinal.

Unlike cardinal numbers, every ordinal number is delinable.

### Adverbial
This section is based on [@Smyth1920, §§347].

(TBU)

## Decimal Systems before Ionian Systems
### Linear B (TBU)

### Attic
Attic number system is the oldest number system after Linear B numbers.  It is a decimal system like Egyptian Hieroglyphic numerals. Similarly to Roman numerals, Attic numerals have symbols for 1 Ι, 5 Π, 10 Δ, 50 𐅄, 100 Η, 500 𐅅, 1000 Χ, 5000 𐅆, 1,0000 Μ, and 5,0000 𐅇—they are simply lined up, as 153 Η𐅄ΙΙΙ and 44 ΔΔΔΔΙΙΙΙ [@GMT1, pp. 41--42].

## Ionian Decimal Systems or Ordinary Alphabetic Numerals
### Common Ionian
This section describes the common number system used since Classic period (5c. BCE) to modern age.

Ionian notation is decimal system where different letters are assigned for
every digit. For example, 111 $(= 100 + 10 + 1)$ is expressed by
[ρια]{.overlined} which consists of [ρ]{.overlined} denoting 100,
[ι]{.overlined} 10, and [α]{.overlined} 1.

Here are symbols representing 1 to 9000, based on [@Heath1931, p. 18].

| Number | Symbol          | Number | Symbol          | Number | Symbol          | Number | Symbol           |
|--------|-----------------|--------|-----------------|--------|-----------------|--------|------------------|
|      1 | [α]{.overlined} |     10 | [ι]{.overlined} |    100 | [ρ]{.overlined} |   1000 | [͵α]{.overlined} |
|      2 | [β]{.overlined} |     20 | [κ]{.overlined} |    200 | [σ]{.overlined} |   2000 | [͵β]{.overlined} |
|      3 | [γ]{.overlined} |     30 | [λ]{.overlined} |    300 | [τ]{.overlined} |   3000 | [͵γ]{.overlined} |
|      4 | [δ]{.overlined} |     40 | [μ]{.overlined} |    400 | [υ]{.overlined} |   4000 | [͵δ]{.overlined} |
|      5 | [ε]{.overlined} |     50 | [ν]{.overlined} |    500 | [φ]{.overlined} |   5000 | [͵ε]{.overlined} |
|      6 | [ϛ]{.overlined} |     60 | [ξ]{.overlined} |    600 | [χ]{.overlined} |   6000 | [͵ϛ]{.overlined} |
|      7 | [ζ]{.overlined} |     70 | [ο]{.overlined} |    700 | [ψ]{.overlined} |   7000 | [͵ζ]{.overlined} |
|      8 | [η]{.overlined} |     80 | [π]{.overlined} |    800 | [ω]{.overlined} |   8000 | [͵η]{.overlined} |
|      9 | [θ]{.overlined} |     90 | [ϟ]{.overlined} |    900 | [ϡ]{.overlined} |   9000 | [͵θ]{.overlined} |

There were a few way to distinguish numbers from ordinal texts. Usual way used
in manuscripts is drawing overline over a number (e.g., [κε]{.overlined} 25).
In Modern Greek, symbol “ʹ” κεραία (U+0374 GREEK NUMERAL SIGN) is attached to the right top (e.g., κεʹ 25).

[@Heath1931, pp.17--18] explains:

> To distinguish letters denoting numbers from the letters
> forming words in any passage various devices were used.
> The numeral might be put between dots, ⁝ or :, or space
> might be left on each side. In Imperial times it became
> usual to put a horizontal stroke over the numeral, e.g.
> ἡ βουλὺ τῶν Χ̄, variations being ⸱Χ⸱ and Χ̆ the like. In cursive
> writing the stroke over the letter became the orthodox
> mark for the numeral or the collection of numeral signs.

[@EmdeBoas2019, §9.13] insists the symbol order is arbitrary:

> Complex numbers are formed by combining the letter symbols. Only the rightmost letter (and the leftmost with numbers over 1000) have the stroke:
> 
> τιθʹ = 319 (any ordering was possible: τθιʹ, θτιʹ, etc.)
> 
> ͵ατιθʹ = 1319

although I have never seen any ordering other than the descending order.

Greek started to use _zero_ since Hellenistic times [@EmdeBoas2019, §9.13]. The symbol was registered in Unicode as U+1018A 𐆊. See [@Unicode-L2/04-054] for details.

For numbers 1,0000 and followings, Ancient Greeks stack number symbols on “Μ” stands for μύριοι “ten-thousand.” For example,  <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">͵ζροε</span></span>[͵εωοε]{.overlined} meaning 7175,5875.

### Diophantus
For numbers 1,0000 and followings, Diophantus put a dot instead of using stacked number with “Μ”, as used in
_Arithmetica_ iv. 18 [@GMT2, p. 550], where 26,2143 (κϛ.͵βρμγ) appears as a numerator (Note: contrary to modern mathematics notation, a numerator is located _below_ a denominator).

> Ἐπὶ τὰς ὑποστάσεις· ἔσται ὁ α^ος^ ἑνὸς ιϛ^ον^, ὁ δὲ β^ος^ <span style="display: inline-flex; flex-direction: column; vertical-align: middle;"><span style="text-align: center; line-height: 1em;">͵δϟϛ</span><span style="text-align: center; line-height: 1em;">κϛ. ͵βρμγ</span></span>.

and [@Heath1897, p. lxix]

> Diophantus denoted myriads followed by thousands by the ordinary signs
> for numbers of units, only separating them by a dot from the thousands. Thus
> for 3,069,000 he writes <span style="text-decoration: overline;">τϛ</span>.<wbr><span style="text-decoration: overline;">͵θ</span>, and <span style="text-decoration: overline;">λγ</span>.<wbr><span style="text-decoration: overline;">͵αψοϛ</span> for 331,776.

This converter does not yet support <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> prefix described in [@GMT1, p. 44]

> Another method is to use the sign Μ or <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> for the
> myriad and to put the number of myriads after it,
> separated by a dot from the thousands.
>
> Thus
>
> <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span><span><span style="text-decoration: overline; line-height: 2em;">ρδ</span><span>.<wbr></span><span style="text-decoration: overline; line-height: 2em;">͵ηφοϛ</span></span> (Diophantus vi. 22, ed. Tannery 446. 11).

This converter extends the system for numbers greater than 9999,9999, interpreting the system “putting a dot between every myriads.”

### Heron
Some other writers including Heron  used another system for myriads---they wrote two dots “¨” to multiply a number symbol by ten thousand. [@GMT1, p. 44] says

> In a third method the symbol M is not used, but the
> symbol representing the number of myriads has two
> dots placed over it.
>
> Thus
>
> α̈. <span style="text-decoration: overline;">͵ηχϟϛ</span> = 18596 (Heron, _Geometrica_ xvii. 33, ed. Heiberg 348. 35).
>
> Heron commenly wrote the word μυριάδες in full.

and [@Heath1897, p. lxix] says

> Sometimes myriads
> were represented by the ordinary letters with two dots above, as ρ̈ = 100 myriads
> (1,000,000), and myriads of myriads with two pairs of dots, as ϊ̈ for 10 myriad-myriads
> (1,000,000,000).

### Aristarchus

Based on [Greek number systems](http://www-history.mcs.st-andrews.ac.uk/HistTopics/Greek_numbers.html), which is apparently written by those who do not know Greek language, hence not reliable.
I’m now finding more reliable sources.

This converter extends the system for numbers greater than 9999,9999, interpreting the system “putting Μ between every myriads.”

### Apollonius

Apollonius invented his own way to denote bigger numbers based on myriad [@Hultsch1876, pp. 2--29].

Optionally a number 1 to 9999 may be referred as a multiple of “μ^ο^” meaning μονάς “unit,” then a multiple of ten thousand (1,0000) is expressed as a multiple of “μ^α^” meaning μυριάδες ἁπλαῖ “single myriads.” Similarly squared ten thousand (1,0000,0000) is represented by “μ^β^” meaning μυριάδες διπλαῖ “double myriads,”  cubed  ten thousand (1,0000,0000,0000) by “μ^γ^” meaning μυριάδες τριπλαῖ “triple myriad,” and so on. For example, 12,0045,6789 would be written as μ^β^ [ιβ]{.overlined} καὶ μ^α^ [με]{.overlined} καὶ μ^ο^ [͵ϛψπθ]{.overlined} “12 double myriads and 45 single myriads and 6789 units.” 

| Symbol   | Word                    | Number                            |
|----------|-------------------------|-----------------------------------|
| μ^ο^     | μονάς                   | $10^0 = 1$                        |
| μ^α^     | μυριάδες ἁπλαῖ          | $10^{1⨯4} = 1,0000$               |
| μ^β^     | μυριάδες διπλαῖ         | $10^{2⨯4} = 1,0000,0000$          |
| μ^γ^     | μυριάδες τριπλαῖ        | $10^{3⨯4} = 1,0000,0000,0000$     |
| μ^(_n_)^ | μυριάδες _n_-πλαῖ       | $10^{4n}$                        |
| μ^β^ ιβ  | δώδεκα μυριάδες τριπλαῖ | $12⨯10^{3⨯4} = 12,0000,0000,0000$ |

His system is similar to 萬進法 “base-ten-thousand system” used in East Asia, comparing to Archimedes’s one similar to 萬萬進法 “base-hundred-million system.”

Due to limitation of printing technology, (Hultsch 1876) typeset an exponent as a superscript as μ^ο^, while two manuscripts, Vat. gr. 218 and Par. gr. 2440, wrote the exponent above μ. I use superscripts in the description texts and stacked numbers in the converter.

#### Modified Apollonius

In Apollonius notation, μ^ο^ could represents both μονάδες “units” and μυριάδες ἑβδομηκονταπλαῖ “60-fold myriads.” To distinguish them I introduced case distinction---lowercase μ for μ^ο^ “μονάδες” and uppercase Μ for Μ^α^ “μυριάδες ἁπλαῖ”, Μ^β^ “μυριάδες διπλαῖ”, and so on.

#### Russell Cottrell’s Notation

**Russell Cottrell’s Notation explained in this section was not used by Ancient Greeks. As of now, there is no method to spell out numbers written in this notation.**

This is based on a idea proposed by Russell Cottrell.
Although his description is contradicting to his converter’s outputs, he gave some examples in his Greek Number Converter [Greek Number Converter](http://www.russellcottrell.com/greek/utilities/GreekNumberConverter.htm):

> Partly because of limitations imposed by web page forms, I have modernized the rendering slightly by placing the power of the myriad beside, rather than above, the M; separating the groups by commas; and using the later convention of accent-like upper and lower numeral signs instead of an iota superscript.
> 
> For example:  2,056,839,184 becomes βΜκʹ, αΜ͵εχπγ, ͵θρπδ.
> ͵θρπδ represents the final 9184, ͵εχπγ the 5683, with αΜ indicating that the latter is multiplied by the first power of M (10,000).  βΜκʹ represents 20 multiplied by the second power of M (100,000,000).

Ignoring unclear usage of “ʹ” his idea can be summarized as follows.

- Each group has form `<exponent>Μ<significand>` or `<significand>` (where the exponent is 1), representing $(\text{significand})\times 10^{4(\text{exponent})}$
- Groups are sorted in descending order of their exponents and joined with a comma.

```bnf
<number>        ::= { <group> "," } <group>
<group>         ::= <exponent> "Μ" <significand> [ <number-mark> ]
                  | <significand> ; where exponent is 1
<number-mark>   ::= "ʹ"
<exponent>      ::= <simple-number>
<significand>   ::= <simple-number>
<simple-number> ::= Ionic number 1 to 9999
```

With slight modification, we can unambiguously represent _any_ natural numbers.

- Each group has form `<exponent>Μ<significand>` or `<significand>` (where the exponent is 1), representing $(\text{significand})\times 10^{4(\text{exponent})}$
- Group are sorted in descending order of their exponents and joined with a comma.
- If a exponent consists of groups, put a trailing number-mark to every group in the exponent.
    - E.g., group αΜγʹ,βʹΜκ consist of exponent αΜγ,β (= 3,0002) and significand κ (= 20).

```bnf
<number>        ::= <group(0)> <number-mark>
                  | <groups(0)> <number-mark>
<groups(n)>     ::= <group(n)> <number-mark>*n ( "," <group(n)>  <number-mark>*n )+
                  ; n is a natural number.
                  ; <number-mark> is repeated n times.
<group(n)>      ::= <exponent(n)> "Μ" <significand>
                  | <significand> ; where exponent is 1
<number-mark>   ::= "ʹ"
<exponent(n)>   ::= <group(n)>
                  | <groups(n+1)>
<significand>   ::= <simple-number>
<simple-number> ::= Ionic number 1 to 9999
```

Examples:

- αʹ $= 1$
- αΜβ,γʹ $= 10000^1 \times 2 + 3$
- βΜα,αΜγ,δʹ $= 10000^2 \times 1 + 10000^1 \times 3 + 4$
- αΜβΜγʹ $= 10000^{10000^1 \times 2} \times 3$
- αΜγʹ,βʹΜκʹ $= 10000^{10000^1 \times 3 + 2} + 20$
- βΜαʹ,αʹΜγ,δʹ $= 10000^{10000^2 \times 1 + 1} \times 3 + 4$
- αΜγΜδʹ,αΜβʹʹ,εʹʹΜϛʹ,ζʹΜη,θʹ $= 10000^{10000^{10000^1 \times 3} \times 4 + 10000^{10000^1 \times 2+5} \times 6 + 7} \times 8 + 9$

### Archimedes

Archimedes invented myriad-myriad based numerals in _The Sand Reckoner_ [@Heath1897, p. 227-229]. He introduced a numeral αἱ _l_-στᾶς περιόδου _m_-στῶν ἀριθμῶν _n_, meaning “number _n_ of the _m_-th order of the _l_-th period,” expressing $n × d^{(l − 1)d + m − 1}$, where $d = 1,0000,0000$. In his system, the biggest number is αἱ μυριακισμυριοστᾶς περιόδου μυριακισμυριοστῶν ἀριθμῶν μυρίαι μυριάδες a myriad-myriad units of the myriad-myriad-th order of the myriad-myriad-th period, which is $10^{8 × 10^{16}}$.

## Fractions
### Words representing fractions
There are several ways to express fractions.

- Half ($\frac{1}{2}$): ἥμισυς, ἥμισυς + gen, or ἥμι-_noun_

    > ἥμισυς $\frac{1}{2}$
    > ὁ ἥμισυς τοῦ ἀριθμοῦ _half the number,_ αἱ ἡμίσειαι τῶν νεῶν _half of the ships,_ τὸ ἥμισυ τοῦ στρατοῦ _half the army_
    > ἡμιτάλαντον _half a talent;_
    > [@Smyth1920, §357]

- Half-integer A ($\frac{n}{2}$): $n$ ἥμι-_noun_

  > τρία ἡμιτάλαντα $1\frac{1}{2}$ _talents,_
  > [@Smyth1920, §357]
  
  N.B.[^citation-required-hemisy] $n$ ἥμισυς means $n\frac{1}{2}$, not $\frac{n}{2}$.

  [^citation-required-hemisy]: Citation requred.

- Half-integer B ($m-\frac{1}{2}$): $m$~ord.~ ἥμι-_noun_ or $m$~ord.~ ἥμισυς

  > τρίτον ἡμίμναιον $2\frac{1}{2}$ _minae;_
  > [@Smyth1920, §357]

  > Ἴωνες καὶ Ἀττικοὶ τά δύο ἥμισυ **ἥμισυ τρίτον**[^half-ἡμισύτριτον] φασίν ※
  > προθεὶς τὸ ἐν δὲ Βατουσιάδης ἐν τῷ περὶ μοθσικῆς ἐπιφέρει
  > **τρίτον ἡμιπόδιον·**
  > καὶ τὰ ἓξ ἥμισυ τάλαντα **ἕβδομον ἡμιτάλαντον** καὶ τοὺς τέσσαρας ἥμισυ πήχεις **πέμπτην σπιθαμήν**[^half-σπιθαμή],
  > καθάπερ φησὶν Ἡρόδοτος. και καθόλου sqq.
  > [@Keil1860, p.11] [emphasis and footnotes added]

  [^half-σπιθαμή]: 
    1 [σπιθαμαί][lsj:σπιθαμή] _span_ = 1 ἡμίπηχυς _half-qubit_ = ½ [πήχυς][lsj:πήχυς] _qubits_
    
    [lsj:πήχυς]: http://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.04.0057:entry=ph=xus
    [lsj:σπιθαμή]: http://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.04.0057:entry=ph=xus
    
  [^half-ἡμισύτριτον]: 
      Compound numeral ἥμισυ τρίτον usually represents unit fraction series $\frac{1}{2} + \frac{1}{3}$.

      Passow’s dictionary [@Passow1847], which LSJ based on, regarded this ἥμισυ τρίτον as a single word meaning $2\frac{1}{2}$ rather

      > ἡμισύτρῐτον, τό, Hesych., richtiger ἥμισυ τρίτον, drittenhalb, wofür Spätere 
      > δύο ἥμισυ sagten; vgl. Didym. b. Prisc. t. 2. p. 395 Krehl.

      while [@LSJ1940]

      > ἡμῐσύ-τρῐτον, τό, _a third half,_ i.e. _one_ [sic] _and a half,_ Archil.167.

      and [@Montanari-ἡμισύτριτον-2020-09-05, “ἡμισύτριτον” accessed on 2020-09-05]

      > **ἡμισύτριτον** -ου, τό
      > 
      > [ἥμισυς, τρίτος]
      >
      > **half of three,** _i.e._ 1½\
      > [Archil.]{.smallcaps} 243
      > 
      > ● _written for_ ἥμισυ τρίτον.

      gave sense $1\frac{1}{2}$, referencing the following fragment [@Bergk1882, p. 431].

      > 167\. [147.]
      >
      > Hesych.: [ἥμισυ τρίτον·]{.sperrsatz} δύο ἥμισυ· Ἀρχίλοχος
      > H. Keil (Quaest. Gramm. p. 12) putat Archilochi nomen ex errore ortum:
      > Hesychium usum grammatico, qui τρίτον ἥμισυ et τρίτον ἡμιπόδιον
      > explicaverit, adhibito Archilochi versu: ἐν δὲ Βατουσιάδης,
      > male Archilochi testimonoum retulisse ad ἥμισυ τρίτον. Quae non
      > recte disputata esse docui Philol. XVI 587 seq.

      Regardless of which ἥμισυ τρίτον was an error,
      it clearly means δύο ἥμισυ $2\frac{1}{2}$ in this context
      rather than $1\frac{1}{2}$ given in LSJ.

- Unit fraction ($\frac{1}{n}$): $n$~ord.~-μόριον

  > τριτημόριον $\frac{1}{3}$, πεμπτημόριον $\frac{1}{5}$,
  > [@Smyth1920, §357]

- $\frac{n + 1}{n}$-type fraction: ἐπι-$n$~ord.~

  > ἐπίτριτος $1\frac{1}{3}$, ἐπίπεμπτος $1\frac{1}{5}$,
  > [@Smyth1920, §357]

- Other fraction ($\frac{n}{m}$): τῶν $m$ αἱ $n$ μοῖραι or $n$ $m$~ord.~-μόριον

  > τῶν πέντε αἱ δύο μοῖραι $\frac{2}{5}$.
  > [@Smyth1920, §357]

  > ἡ ὑπεροχὴ τῶν ὀκτὼ **δύο τριτημόριον**
  > [@Bernardakis1895, p. 190] [emphasis mine]

- $\frac{n}{n + 1}$-type fraction: τὰ $n$ μέρη

  > But when the numerator is less by _one_ than the denominator, the
  > genitive is omitted and only the article and μέρη are uses: as τὰ τρία μέρη $\frac{3}{4}$,
  > _i.e. three parts_ (scil. _of four_).
  > [@Smyth1920, §357]

- Unit fraction series ($\frac{1}{m}+\frac{1}{n}+\cdots$): $m$~ord.~ $n$~ord.~ ⋯

  $\frac{1}{2}$ is represented by ἥμισυς, not δεύτερος[^citation-required-deuteros].
  
  [^citation-required-deuteros]: Citation required.

  > δέκα ἓξ ἥμισυ τρίτον ὄγδοον \
  > (ἀρτάβαι) ιϛ 𐅵 γ´ η´
  >
  > <!-- TODO Image -->
  > [bgu.3.988, ll. 16--17][papyri:bgu.3.988] (100 A.D.)

Mixed fractions are simply represented by juxtaposing an integer and a fraction.

> also ἀνὰ δύο ἥμισυ ζῳδίων _amounting to_ 2$\frac{1}{2}$ signs, Autol.1.10
> [@LSJ1940, “ἀνά” C.III.]

<!-- TODO Examples -->

### Notations for fractions
[@Heath1931, pp. 20--22] explains several fraction notations.

\newcommand{\verticalHalfSymbol}{}

Unit fractions can be expressed with “ʹ” instead of a overbar (e.g., γʹ $\frac{1}{3}$), aside from special symbols for $\frac{1}{2}$ 𐅵 and $\frac{2}{3}$ 𐅷.
<!-- [@Heath1931, p. 20] uses 
<svg id="half-mark" x="0px" y="0px" width="1ex" height="2ex" viewBox="-10 0 40 100">
  <path d="M 0 0 L 0 100 L 30 70" fill="none" stroke="black" stroke-width="5" />
</svg>
and 𐅷, respectively.
-->


> We find in Archimedes <svg id="half-mark" x="0px" y="0px" width="1ex" height="2ex" viewBox="-10 0 40 100"> <path d="M 0 0 L 0 100 L 30 70" fill="none" stroke="black" stroke-width="5" /> </svg>ʹ δʹ = $\frac{1}{2} \frac{1}{4}$ for $\frac{3}{4}$,
> and in Heron κθ 𐅷ʹ ιγʹ λθʹ = $29\frac{2}{3} \frac{1}{13} \frac{1}{39}$ for $29 \frac{10}{13}$, and so on.
> [@Heath1931, p. 20]

Instead of single “ʹ”, double “″” can be used.

> A less orthodox method (found in later manuscripts) was to
> affix two accents, e.g., ζ″ = $\frac{1}{7}$. Diophantus uses, instead of
> the accent, a sign which Tannery printed as <svg id="tannery-mark" x="0px" y="0px" width="2ex" height="2ex" viewBox="-10 0 90 100"><path d="M 0 0 c 30 0 80 40 80 80 m -80 0 l 75 -70" fill="none" stroke="black" stroke-width="5" /></svg>, e.g., γ^<svg id="tannery-mark" x="0px" y="0px" width="1ex" height="1ex" viewBox="-10 0 90 100"><path d="M 0 0 c 30 0 80 40 80 80 m -80 0 l 75 -70" fill="none" stroke="black" stroke-width="10" /></svg>^ = $\frac{1}{3}$.
>
> Hence the numerator could be represented by the ordinary
> numeral, and the denominator by the accented numeral
> meaning the aliquot part.
> [@Heath1931, p. 20]

<!-- TODO Fractions
For non-unit fractions can be expressed as a pair of a numerator and a denominator. They may be juxtaposed like θ′ια″ 9/11. Heron repeated a denominator twice like θ′ια″ια″.  Diophantus also spelled out word ἐν μορίῳ “in a part of” or μορίου “part of” as in τϛ.͵θ μορ. λγ.͵αψοϛ “306,9000/33,1776.”

Diophantus also vertically stacked a numerator and a denominator like modern notation, except for their positions are swapped.   Like = 5/3 and  = 127,0568/1,0816.
-->

## Sexagesimal Systems
### Sexagesimal
Ancient Greeks inherited sexagesimal (base-60) system invented in Mesopotamian mathematics. In Ancient Greek ordinal number ἑξηκοστός “sixtieth” means fraction 1/60 as well as English, as I explained in the previous section. Minutes is called πρῶτα ἑξηκοστά “first sixtieth,” second is called δεύτερα ἑξηκοστά “second sixtieth,” and so on [@GMT1, pp. 48--61].

- 200′15″: ἀπὸ τῶν λοιπῶν πρώτων ἑξηκοστῶν <span style="text-decoration: overline;">σ</span> καὶ δευτέρων <span style="text-decoration: overline;">ιε</span> [@GMT1, pp. 50]
- 124′ ... 7440″: <span style="text-decoration: overline;">ρκδ</span> πρῶτα ἑξηκοστὰ ... εἰς δεύτερα <span style="text-decoration: overline;">͵ζυμ</span> [@GMT1, pp. 58]
- 67°4′: <span style="text-decoration: overline;">ξζ</span> <span style="text-decoration: overline;">δ</span> [@GMT1, pp. 58]
- 134°8′: <span style="text-decoration: overline;">ρλδ</span> <span style="text-decoration: overline;">η</span> [@GMT1, pp. 58]

### Sexagesimal Ptolemy
Ancient Greeks, especially Ptolemy, used zero in sexagesimal fractions. [@GMT1, p. 47] says

> In his sexagesimal notation, Ptolemy used the symbol **O**
> to stand for οὐδεμία μοῖρα or οὐδὲν ἑξηκοστόν. The diverse
> views which have been held on this symbol from the time of
> Delambre are summed up by Loria (<span lang="it">_Le scienze esatte nell'
> antica Grecia</span>, p.761_) in the words: “<span lang="it">In base ai documenti
> scoperti e decifrati sino ad oggi, siamo autorizzati a negare
> che i Greci usasserolo zero nel senso e nel modo in cui lo
> adoperiamo noi.</span>”

and

- 0^p^47′8″: Ο <span><span style="text-decoration: overline; line-height: 2em;">μζ</span></span> <span><span style="text-decoration: overline; line-height: 2em;">η</span></span> [@GMT2, p. 430]

Unicode proposal L2/04-054 [@Unicode-L2/04-054] has detailed description about _zero_.

# Revisions
All the revisions of this page can be retrieved from GitHub [na4zagin3/na4zagin3.github.io](https://github.com/na4zagin3/na4zagin3.github.io).

- 2019-05-06: Entirely rewritten. Fixed Apollonius method to support monad prefix μ^ο^.
- 2019-05-18: Output in words too.
- 2019-10-21: Rewrote section “Apollonius” and brushed up others
- 2020-09-06: Brushed up section “Fractions”

# Abbreviations
## General
acc.
: accusative

dat.
: dative

gen.
: genitive

nom.
: nominative

## Texts
Polyb.Hist.
: [Polybius, _Histories_](http://www.perseus.tufts.edu/hopper/text?doc=Perseus:text:1999.01.0233)

## Papyri

bgu.3.988
: <http://papyri.info/ddbdp/bgu;3;988>

[papyri:bgu.3.988]: http://papyri.info/ddbdp/bgu;3;988

# References
