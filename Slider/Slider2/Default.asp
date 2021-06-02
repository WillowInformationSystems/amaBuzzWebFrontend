

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  




  <title>CodePen - Rolling Range Slider</title>
  
  
  
  
<style>
html,
body {
  margin: 0;
  height: 100%;
}
.SliderBody {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: white;
}
input[type="range"] {
  -webkit-appearance: none;
  background: transparent;
  width: 90%;
  max-width: 500px;
  outline: none;
}
input[type="range"]:focus,
input[type="range"]:active,
input[type="range"]::-moz-focus-inner,
input[type="range"]::-moz-focus-outer {
  border: 0;
  outline: none;
}
input[type="range"]::-moz-range-thumb {
  border: none;
  height: 50px;
  width: 50px;
  background-color: transparent;
  background-image: url("/Amabuzz/Slider/Slider2/thumbs-sprite.png");
  background-position: 0 0;
  background-size: cover;
  transform: scale(1.9) rotateZ(var(--thumb-rotate, 10deg));
  cursor: pointer;
}
input[type="range"]::-moz-range-thumb:active {
  background-position: 100% 0px;
  transform: scale(2) rotateZ(var(--thumb-rotate, 10deg));
}
input[type="range"]::-moz-range-track {
  width: 100%;
  height: 20px;
  background: #eee;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.4);
  cursor: pointer;
}
input[type="range"]::-moz-range-progress {
  height: 20px;
  background: #4685d7;
  border-radius: 10px;
  cursor: pointer;
}
input[type="range"]::-webkit-slider-thumb {
  border: none;
  height: 50px;
  width: 50px;
  background-color: transparent;
  background-image: url("/Amabuzz/Slider/Slider2/thumbs-sprite.png");
  background-position: 0 0;
  background-size: cover;
  transform: scale(1.9) rotateZ(var(--thumb-rotate, 10deg));
  cursor: pointer;
  margin-top: -15px;
  -webkit-appearance: none;
}
input[type="range"]::-webkit-slider-thumb:active {
  background-position: 100% 0px;
  transform: scale(2) rotateZ(var(--thumb-rotate, 10deg));
}
input[type="range"]::-webkit-slider-runnable-track {
  width: 100%;
  height: 20px;
  background: grey;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.4);
  cursor: pointer;
  -webkit-appearance: none;
}


</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >
<br>
<br>
<br>
<br>


<div align="center">Loan Amount: <a id="LoanAmount">500</a></div><br><br>

<div class="SliderBody">
	
  <input id="slider" name="slider" type="range" value=0><br>

</div>
<br>
<br>

<table cellspacing="2" cellpadding="2" border="1" align="center">
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
Interest Rate per month: <input type="text" id="InterestRatePM" value="0.05"/><br>
Monthly Fee ex vat: <input type="text" id="MonthlyFee" value="60"/><br>
Initial Fee ex vat: <input type="text" id="InitiationFee" value="165"/><br>
VAT Rate: <input type="text" id="VATRate" value="0.15"/><br>
<input type="button" value="test" onClick="testme();">
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  
  
      <script id="rendered-js" >
	  CalculatePaymentVariables(500);
	  
	  var StartingAmount = 500;
	  var Interval = 25;
	  
	  
const input = document.querySelector("input");

input.addEventListener("input", event => {
  var CurrentValue = input.value
  const value = Number(input.value) / 100;
  input.style.setProperty("--thumb-rotate", `${value * 720}deg`);
 
  var CurrentAmount = StartingAmount + CurrentValue * Interval;
   document.getElementById('LoanAmount').innerHTML = CurrentAmount;
   
   CalculatePaymentVariables(CurrentAmount);
	 
  
});
//# sourceURL=pen.js

function CalculatePaymentVariables(LoanAmount){
	
	//Interest Calcs
	var OneInstalment_Interest = CalculateInterest(LoanAmount,1)
	document.getElementById('OneInstalment_Interest').value = OneInstalment_Interest;
	
	var TwoInstalment_Interest = CalculateInterest(LoanAmount,2)
   	document.getElementById('TwoInstalment_Interest').value = TwoInstalment_Interest;
	
	var ThreeInstalment_Interest = CalculateInterest(LoanAmount,3)
   	document.getElementById('ThreeInstalment_Interest').value = ThreeInstalment_Interest;
	
	//Fees Calcs
   	var OneInstalment_Fees = CalculateFees(LoanAmount,1)
	document.getElementById('OneInstalment_Fees').value = OneInstalment_Fees;
	
	var TwoInstalment_Fees = CalculateFees(LoanAmount,2)
   	document.getElementById('TwoInstalment_Fees').value = TwoInstalment_Fees;
	
	var ThreeInstalment_Fees = CalculateFees(LoanAmount,3)
   	document.getElementById('ThreeInstalment_Fees').value = ThreeInstalment_Fees;
   
	//Total Repayments
	var OneInstalment_TotalRepayment = Number(LoanAmount) + Number(OneInstalment_Interest) + Number(OneInstalment_Fees);
	document.getElementById('OneInstalment_TotalRepayments').value = OneInstalment_TotalRepayment.toFixed(2);
	
	var TwoInstalment_TotalRepayment = Number(LoanAmount) + Number(TwoInstalment_Interest) + Number(TwoInstalment_Fees);
	document.getElementById('TwoInstalment_TotalRepayments').value = TwoInstalment_TotalRepayment.toFixed(2);
	
	var ThreeInstalment_TotalRepayment = Number(LoanAmount) + Number(ThreeInstalment_Interest) + Number(ThreeInstalment_Fees);
	document.getElementById('ThreeInstalment_TotalRepayments').value = ThreeInstalment_TotalRepayment.toFixed(2);
	
	//Instalment
	var OneInstalment_Instalment = OneInstalment_TotalRepayment / 1;
	document.getElementById('OneInstalment_Instalment').value = OneInstalment_Instalment.toFixed(2);
	
	var TwoInstalment_Instalment = TwoInstalment_TotalRepayment / 2;
	document.getElementById('TwoInstalment_Instalment').value = TwoInstalment_Instalment.toFixed(2);
	
	var ThreeInstalment_Instalment = ThreeInstalment_TotalRepayment / 3;
	document.getElementById('ThreeInstalment_Instalment').value = ThreeInstalment_Instalment.toFixed(2);
	
   
}

function CalculateInterest(LoanAmount,NoOfInstalments){
	
	var InterestRate = document.getElementById('InterestRatePM').value;
	var CapitalInstalment = LoanAmount/NoOfInstalments;
	var TotalInterest = 0
	
	for (i = 0; i < NoOfInstalments; i++) {
 	 	
		var CurrentCapitalOutstanding = LoanAmount - (LoanAmount/NoOfInstalments)*i;
		var TotalInterest = TotalInterest + (InterestRate * CurrentCapitalOutstanding);
		
	}
	
	return TotalInterest.toFixed(2);


}

function CalculateFees(LoanAmount,NoOfInstalments){
	
	var VATRate = Number(document.getElementById('VATRate').value);
	var InitiationFee = Number(document.getElementById('InitiationFee').value);
	var MonthlyFee = document.getElementById('MonthlyFee').value * NoOfInstalments;
	
	
	//Additional Initiation Fee is 10% of amount over R1000
	if (LoanAmount > 1000){
		var InitiationFee = InitiationFee + (LoanAmount - 1000) * 0.1
	}
	
	var TotalFees = (InitiationFee + MonthlyFee) * (1 + VATRate);
	
	return TotalFees.toFixed(2);


}


    </script>

  

</body>

</html>
 
