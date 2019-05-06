% Greek Number Converter
% SAKAMOTO Noriaki (\@na4zagin3)

Source code at GitHub [na4zagin3/elm-grcnum](https://github.com/na4zagin3/elm-grcnum).

<script src="elm.min.js"></script>
<div id="elm"></div>
<script>
var app = Elm.Main.init({
  node: document.getElementById('elm')
});
</script>

Inspired from Russell Cottrell’s [Grek Number Converter](http://www.russellcottrell.com/greek/utilities/GreekNumberConverter.htm).

# Systems
## Attic
Based on [@GMT1, pp. 41--42].

## Common Ionian
Based on [@GMT1, pp. 42--44].

## Diophantus
Based on format used Diophantus _Arithmetica_ iv. 18 [@GMT2, p. 550], where 262143 (κϛ.͵βρμγ) appears as numerator (contrary to modern mathematics notation, a numerator is located below a denominator).

> Ἐπὶ τὰς ὑποστάσεισ! ἔσται ὁ α^ος^ ἑνὸς ιϛ^ον^, ὁ δὲ β^ος^ <span style="display: inline-flex; flex-direction: column; vertical-align: middle;"><span style="text-align: center; line-height: 1em;">͵δϟϛ</span><span style="text-align: center; line-height: 1em;">κϛ. ͵βρμγ</span></span>.

and [@Heath1897, p. lxix]

> Diophantus denoted myriads followed by thousands by the ordinary signs
> for numbers of units, only separating them by a dot from the thousands. Thus
> for 3,069,000 he writes  and  for 331776.

This converter does not yet support <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> prefix although [@GMT1, p. 44] says

> Another method is to use the sign Μ or <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span> for the
> myriad and to put the number of myriads after it,
> separated by a dot from the thousands.
>
> Thus
>
> <span style="display: inline-flex; flex-direction: column-reverse;"><span style="text-align: center; line-height: 1em;">Μ</span><span style="text-align: center; line-height: 1em; font-size: smaller;">Υ</span></span><span><span style="text-decoration: overline; line-height: 2em;">ρδ</span><span>.<wbr></span><span style="text-decoration: overline; line-height: 2em;">͵ηφοϛ</span></span> (Diophantus vi. 22, ed. Tannery 446. 11).

## Heron
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

## Aristarchus

Although the algorithm is based on [Greek number systems](http://www-history.mcs.st-andrews.ac.uk/HistTopics/Greek_numbers.html), which is full of mistakes, it is not reliable.
I’m now trying to find reliable sources.

## Apollonius

Based on [@Hultsch1876, pp. 2--29].

## Modified Apollonius

I slightly modified the system to distinguish μ^ο^ “μονάδες” vs. Μ^α^ “μυριάδες ἁπλαῖ”, Μ^β^ “μυριάδες διπλαῖ”, and so on.


## Sexagesimal
Based on [@GMT1, pp. 48--61].

- 200′15″: ἀπὸ τῶν λοιπῶν πρώτων ἑξηκοστῶν <span style="text-decoration: overline;">σ</span> καὶ δευτέρων <span style="text-decoration: overline;">ιε</span> [@GMT1, pp. 50]
- 124′ ... 7440″: <span style="text-decoration: overline;">ρκδ</span> πρῶτα ἑξηκοστὰ ... εἰς δεύτερα <span style="text-decoration: overline;">͵ζυμ</span> [@GMT1, pp. 58]
- 67°4′: <span style="text-decoration: overline;">ξζ</span> <span style="text-decoration: overline;">δ</span> [@GMT1, pp. 58]
- 134°8′: <span style="text-decoration: overline;">ρλδ</span> <span style="text-decoration: overline;">η</span> [@GMT1, pp. 58]

## Sexagesimal Ptolemy
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


# References
