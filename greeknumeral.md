% Comprehensive Greek Number Converter
% SAKAMOTO Noriaki (\@na4zagin3)

---
date: 2019-05-06
...

Source code at GitHub [na4zagin3/elm-grcnum](https://github.com/na4zagin3/elm-grcnum).

# Converter
<script src="elm.min.js"></script>
<div id="elm"></div>
<script>
var app = Elm.Main.init({
  node: document.getElementById('elm')
});
</script>

Inspired from Russell Cottrell’s [Greek Number Converter](http://www.russellcottrell.com/greek/utilities/GreekNumberConverter.htm).

# Notations
In this document, I use myriad separators (e.g., 1234,5678,9012) rather than thousand separators (e.g., 123,456,789,012).
For sexagesimal notations, I write 12°34′56″7‴8⁗ for degrees (360 degrees = 1 turn), 12^p^34′56″7‴8⁗ for segments (120 segments = 1 diameter; “p” stands for _pars_), and modern notation like 1,2;3,4  for general sexagesimal fractions.
In modern sexagesimal notation, “,” is a sexagesimal separator and “;” is followed by a fraction part. Therefore $\text{1,2;3,4} = 1 \times 60 + 2 + \frac{3}{60} + \frac{4}{60^2}$.

# Systems
## Decimal Systems before Ionian Systems
### Attic
Based on [@GMT1, pp. 41--42].

## Ionian Decimal Systems or Ordinary Alphabetic Numerals
### Common Ionian
Based on [@GMT1, pp. 42--44].

### Diophantus
Based on format used Diophantus _Arithmetica_ iv. 18 [@GMT2, p. 550], where 26,2143 (κϛ.͵βρμγ) appears as a numerator (Note: contrary to modern mathematics notation, a numerator is located below a denominator).

> Ἐπὶ τὰς ὑποστάσεις· ἔσται ὁ α^ος^ ἑνὸς ιϛ^ον^, ὁ δὲ β^ος^ <span style="display: inline-flex; flex-direction: column; vertical-align: middle;"><span style="text-align: center; line-height: 1em;">͵δϟϛ</span><span style="text-align: center; line-height: 1em;">κϛ. ͵βρμγ</span></span>.

and [@Heath1897, p. lxix]

> Diophantus denoted myriads followed by thousands by the ordinary signs
> for numbers of units, only separating them by a dot from the thousands. Thus
> for 3,069,000 he writes  and  for 331776.

This converter does not yet support <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> prefix described in [@GMT1, p. 44]

> Another method is to use the sign Μ or <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> for the
> myriad and to put the number of myriads after it,
> separated by a dot from the thousands.
>
> Thus
>
> <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span><span><span style="text-decoration: overline; line-height: 2em;">ρδ</span><span>.<wbr></span><span style="text-decoration: overline; line-height: 2em;">͵ηφοϛ</span></span> (Diophantus vi. 22, ed. Tannery 446. 11).

This converter extended the system so that it can represents numbers greater than 9999,9999.

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

Although the algorithm is based on [Greek number systems](http://www-history.mcs.st-andrews.ac.uk/HistTopics/Greek_numbers.html), which is full of mistakes, it is not reliable.
I’m now trying to find reliable sources.

### Apollonius

Based on [@Hultsch1876, pp. 2--29].

### Modified Apollonius

I slightly modified the system to distinguish μ^ο^ “μονάδες” vs. Μ^α^ “μυριάδες ἁπλαῖ”, Μ^β^ “μυριάδες διπλαῖ”, and so on.


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

# References
