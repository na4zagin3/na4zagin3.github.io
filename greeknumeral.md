% Greek Number Converter
% na4zagin3

<script src="https://peterolson.github.com/BigInteger.js/BigInteger.min.js"></script>
<script src="greeknumeral.js"/>

<script>
</script>

Inspired from

- <http://www.russellcottrell.com/greek/utilities/GreekNumberConverter.htm>.
- <http://www-history.mcs.st-andrews.ac.uk/HistTopics/Greek_numbers.html>.
- <https://books.google.co.jp/books?id=hdw5AAAAIAAJ&pg=PR69&lpg=PR69&dq=Myriad+greek+numeral&source=bl&ots=WnDgh9izs4&sig=fHko32UGPPKlsL_Bkyk6Iqh6qoc&hl=ja&sa=X&ved=0CEYQ6AEwCDgKahUKEwifvuLb_ubIAhXBN6YKHc9zBMw#v=onepage&q=Myriad%20greek%20numeral&f=false>

From 
<form name="theForm" onSubmit="convert(); return false" action="">
<table border=0 cellPadding=0 cellSpacing=5 width="100%">
<tr><td><input type="text" name="theNumber" size="53" placeholder="e.g. 1024"/>&nbsp;<a href="javascript:;" onClick="convert(); return false"><b>Convert!</b></a></td>
<td align="right"><a href="javascript:;" onClick="inc(-1); return false"><big>«</big></a> | <a href="javascript:;" onClick="inc(1); return false"><big>»</big></a> | <a href="javascript:;" onClick="rst(); return false">Reset</a></td></tr>
</table>
<table border=0 cellPadding=0 cellSpacing=5 width="100%">
<tr>
<td>
Common:
</td>
<td>
<textarea name="normal" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
<tr>
<td>
modified Diophantus:
</td>
<td>
<textarea name="Diophantus" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
<tr>
<td>
modified Aristarchus:
</td>
<td>
<textarea name="Aristarchus" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
<td>
modified Apollonius with comma:
</td>
<td>
<textarea name="ApolloniusA" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
</tr>
<tr>
<td>
modified Apollonius without comma:
</td>
<td>
<textarea name="ApolloniusB" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
<tr>
<td>
Apollonius:
</td>
<td>
<textarea name="ApolloniusC" class="greek" cols=80 rows=2 readOnly style="width: 99%; overflow: visible; padding: 5px"></textarea>
</td>
</tr>
</table>



</form>




