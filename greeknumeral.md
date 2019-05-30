% Comprehensive Greek Number Converter
% SAKAMOTO Noriaki (\@na4zagin3)

---
date: 2019-05-30
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

# Notations
In this document, I use myriad separators (e.g., 1234,5678,9012) rather than thousand separators (e.g., 123,456,789,012).
For sexagesimal notations, I write 12°34′56″7‴8⁗ for degrees (360 degrees = 1 turn), 12^p^34′56″7‴8⁗ for segments (120 segments = 1 diameter; “p” stands for _partes_ “parts”), and modern notation like 1,2;3,4  for general sexagesimal fractions.
In modern sexagesimal notation, “,” is a sexagesimal separator and “;” is followed by a fraction part. Therefore $\text{1,2;3,4} = 1 \times 60 + 2 + \frac{3}{60} + \frac{4}{60^2}$.

Throughout the document Greek texts smallcase and uppercase letters are distinguished (e.g., μ vs. Μ) for readability and to follow modern printing conventions. That distinction _did not exist_ in Ancient Greek; minuscule script was invented in 9th century [@Irigoin1996, p.69].

# Systems
## Numerals
In every language numbers are represented in sound, therefore this converter firstly spell out the numbers.

This converter uses Attic dialect, therefore
geminated consonant ττ appears instead of σσ in Ionic dialect and Koiné Greek. E.g., τέτταρες instead of τέσσαρες.


### Cardinal
Based on [@Smyth1920, §§347,349--350].

In Attic dialect, 13 and 14 are represented by a compound number rather than compound words, thus τρεῖς καὶ δέκα and τέτταρες καὶ δέκα rather than τρεισκαίδεκα and τετταρεσκαίδεκα, respectively.

εἴκοσι(ν) 20 has a [movable nu](https://en.wikipedia.org/wiki/Movable_nu), which appears as εἴκοσι or εἴκοσιν.

Word order are usually one of the following possible orders:

- Descending order with conjunction: _ones_ καὶ _tens_ καὶ _hundreds_ καὶ _thousands_
- Ascending order with conjunction: _thousands_ καὶ _hundreds_ καὶ _tens_ καὶ _ones_
- Ascending order without conjunction: _thousands_ _hundreds_ _tens_ _ones_

#### Common systems for numbers greater than 9999
In this section, emphasis and quoted translations to Greek texts are mine.

There are two kinds of numerals to represent numbers greater than 9999. Here I call them _n_-κισμύριοι system and _n_ μυριάδες system.

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

Both system were even used in the same sentence like
πεζῶν μὲν ἔχων εἰς **ἐννέα μυριάδας** (9,0000 acc.), ἱππεῖς δὲ περὶ **μυρίους καὶ δισχιλίους** (1,2000 acc.).
Polyb.Hist.3.35.1

Generally speaking, _n_-κισμύριοι system is limited for smaller numbers namely $n \le 7$. A notable exception is Polybius’s
πεντηκοντακισμυρίους καὶ τετρακισμυρίους Polyb.Hist.21.43.19, representing 54,0000.
On the other hand, _n_ μυριάδες system can be used for bigger numbers. Especially, mathematical documents prefers _n_ μυριάδες system over _n_-κισμύριοι system.


### Ordinal
(WIP)

### Adverbial
Based on [@Smyth1920, §§347].

## Decimal Systems before Ionian Systems
### Attic
Based on [@GMT1, pp. 41--42].

## Ionian Decimal Systems or Ordinary Alphabetic Numerals
### Common Ionian
Based on [@GMT1, pp. 42--44].

### Diophantus
Based on format used Diophantus _Arithmetica_ iv. 18 [@GMT2, p. 550], where 26,2143 (κϛ.͵βρμγ) appears as a numerator (Note: contrary to modern mathematics notation, a numerator is located _below_ a denominator).

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
[@GMT1, p. 44] says

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

Based on [@Hultsch1876, pp. 2--29].

#### Modified Apollonius

I slightly modified the system to distinguish μ^ο^ “μονάδες” vs. Μ^α^ “μυριάδες ἁπλαῖ”, Μ^β^ “μυριάδες διπλαῖ”, and so on.

#### Russell Cottrell’s Notation

**This notation is not used by Ancient Greeks. As of now, there is no method to spell out numbers written in this notation.**

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

TBU. He invented myriad-myriad based numerals in _The Sand Reckoner._

## Fractions (TBU)

## Sexagesimal Systems
### Sexagesimal
Based on [@GMT1, pp. 48--61].

- 200′15″: ἀπὸ τῶν λοιπῶν πρώτων ἑξηκοστῶν <span style="text-decoration: overline;">σ</span> καὶ δευτέρων <span style="text-decoration: overline;">ιε</span> [@GMT1, pp. 50]
- 124′ ... 7440″: <span style="text-decoration: overline;">ρκδ</span> πρῶτα ἑξηκοστὰ ... εἰς δεύτερα <span style="text-decoration: overline;">͵ζυμ</span> [@GMT1, pp. 58]
- 67°4′: <span style="text-decoration: overline;">ξζ</span> <span style="text-decoration: overline;">δ</span> [@GMT1, pp. 58]
- 134°8′: <span style="text-decoration: overline;">ρλδ</span> <span style="text-decoration: overline;">η</span> [@GMT1, pp. 58]

### Sexagesimal Ptolemy
Based on [@GMT1, p. 47]

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

# Revisions
All the revisions of this page can be retrieved from GitHub [na4zagin3/na4zagin3.github.io](https://github.com/na4zagin3/na4zagin3.github.io).

2019-05-06: Entirely rewritten. Fixed Apollonius method to support monad prefix μ^ο^.
2019-05-18: Output in words too.

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

# References
