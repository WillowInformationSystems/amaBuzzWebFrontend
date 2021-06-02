

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - Loan Calculator with  two jquery  slider inputs </title>
  
  
  <link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/themes/smoothness/jquery-ui.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
  
<style>
.ui-slider {
    margin:20px;
    width: 400px;
}

h1 {
  font-size: 1.3em;
  font-weight:900;
}
</style>


</script>


</head>

<body translate="no" >
  Loan Amount<div id="slider1"></div>
Your Loan <input type="text" id="amount" value="500"/><br /><br />

<table cellspacing="2" cellpadding="2" border="1">
<tr>
	<th>1 Instalment</th>
	<th>2 Instalments</th>
	<th>3 Instalments</th>
</tr>
<tr>
    <td>
		Instalment: <input type="text" id="OneInstalment_Instalment" value=""/><br>
		Total Repayments: <input type="text" id="OneInstalment_TotalRepayments" value=""/><br>
		Interest: <input type="text" id="OneInstalment_Interest" value=""/><br>
		Fees: <input type="text" id="OneInstalment_Fees" value=""/><br>
	</td>
    <td>
		Instalments: <input type="text" id="TwoInstalment_Instalment" value=""/><br>
		Total Repayments: <input type="text" id="TwoInstalment_TotalRepayments" value=""/><br>
		Interest: <input type="text" id="TwoInstalment_Interest" value=""/><br>
		Fees: <input type="text" id="TwoInstalment_Fees" value=""/><br>
	</td>
    <td>
		Instalments: <input type="text" id="ThreeInstalment_Instalment" value=""/><br>
		Total Repayments: <input type="text" id="ThreeInstalment_TotalRepayments" value=""/><br>
		Interest: <input type="text" id="ThreeInstalment_Interest" value=""/><br>
		Fees: <input type="text" id="ThreeInstalment_Fees" value=""/><br>
	</td>
</tr>
</table>


<p>

<p>

<p>
 
 
Loan Length<div id="slider2"></div>
 
 
Days Loaned <input type="text" id="days" value="1"/><br /><br />
Repayment Date<br />
<div id="date"></div><br />
Your Loan
<input id="amount2" type="text" />
Interest
<input id="amount3" type="text" /><br />
APR
<input id="amount4" type="text" /><br />
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js'></script>
  
      <script id="rendered-js" >
$(document).ready(function () {
  function update() {
    $interest = 0.05;
    $perday = 15;
    $amount1 = $("#amount").val();
    $dayscount = $("#days").val();
    $amount2 = parseInt($amount1) + $interest * parseInt($amount1) + parseInt($dayscount) * ($perday / 100);
    $apr = ($amount2 - $amount1 / $amount1) / (parseInt($dayscount) / 365 * 10000);
    $("#amount2").val($amount2);
    $("#amount3").val(parseFloat($amount2 - $amount1).toFixed(2));
    $("#amount4").val($apr);
  }

  debugger;

  $("#slider1").slider({
    max: 3000,
    min: 500,
    step: 100,
    slide: function (event, ui) {

      $("#amount").val(ui.value);
      update();

    } });




  function addDaysToDate(days) {
    var mths = new Array("Jan", "Feb", "Mar",
    "Apr", "May", "Jun", "Jul", "Aug", "Sep",
    "Oct", "Nov", "Dec");

    var d = new Date();
    d.setHours(d.getHours() + 24 * days);

    var currD = d.getDate();
    var currM = d.getMonth();
    var currY = d.getFullYear();

    return mths[currM] + " " + currD + ", " + currY;
  }



  $("#slider2").slider({
    max: 30,
    min: 1,

    slide: function (event, ui) {

      $("#days").val(ui.value);
      $("#date").text(addDaysToDate(parseInt($("#days").val())));
      update();
    },
    create: function (event, ui) {
      $("#date").text(addDaysToDate(parseInt($("#days").val())));
    } });


  $("#days").val($("#slider2").slider("value"));

  $("#days").change(function (event) {
    var data = $("#days").val();
    if (data.length > 0)
    {
      if (parseInt(data) >= 0 && parseInt(data) <= 31)
      {
        $("#slider2").slider("option", "value", data);
      } else

      {
        if (parseInt(data) < 1)
        {
          $("#days").val("1");
          $("#slider2").slider("option", "value", "1");
        }
        if (parseInt(data) > 31)
        {
          $("#days").val("31");
          $("#slider2").slider("option", "value", "31");
        }
      }
    } else

    {
      $("#slider2").slider("option", "value", "1");
    }
    $("#date").text(addDaysToDate(parseInt($("#days").val())));
  });

  update();
});
//# sourceURL=pen.js
    </script>

  

</body>

</html>
 
