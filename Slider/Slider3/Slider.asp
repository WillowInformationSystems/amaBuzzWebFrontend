
    <link rel="stylesheet" href="/Amabuzz/Slider/Slider3/rangeslider.css">
    
    <!--[if lt IE 9]>
        <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
    <![endif]-->
	
	<!-- https://rangeslider.js.org/ -->

    <div>
        <h2>Loan Slider</h2>
        <input type="range" value="1500" min="500" max="3000" step="50" data-orientation="horizontal" data-rangeslider>
        <br>
        <output></output>
    </div>
<table cellspacing="2" cellpadding="2" border="1" align="center">
<tr>
	<th>1 Instalment</th>
	<th>2 Instalments</th>
	<th>3 Instalments</th>
</tr>
<tr>
    <td>
		Instalment: <a id="OneInstalment_Instalment"></a><br>
		Total Repayments: <a id="OneInstalment_TotalRepayments"></a><br>
		Interest: <a id="OneInstalment_Interest"></a><br>
		Fees: <a id="OneInstalment_Fees"></a><br>
	</td>
    <td>
		Instalments: <a id="TwoInstalment_Instalment"></a><br>
		Total Repayments: <a id="TwoInstalment_TotalRepayments"></a><br>
		Interest: <a id="TwoInstalment_Interest"></a><br>
		Fees: <a id="TwoInstalment_Fees"></a><br>
	</td>
    <td>
		Instalments: <a id="ThreeInstalment_Instalment"></a><br>
		Total Repayments: <a id="ThreeInstalment_TotalRepayments"></a><br>
		Interest: <a id="ThreeInstalment_Interest"></a><br>
		Fees: <a id="ThreeInstalment_Fees"></a><br>
	</td>
</tr>
</table>
Interest Rate per month: <input type="text" id="InterestRatePM" value="0.05"/><br>
Monthly Fee ex vat: <input type="text" id="MonthlyFee" value="60"/><br>
Initial Fee ex vat: <input type="text" id="InitiationFee" value="165"/><br>
VAT Rate: <input type="text" id="VATRate" value="0.15"/><br>
<input type="button" value="test" onClick="testme();">

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="/Amabuzz/Slider/Slider3/rangeslider.js"></script>
<script>
    $(function() {

        var $document = $(document);
        var selector = '[data-rangeslider]';
        var $element = $(selector);

        // For ie8 support
        var textContent = ('textContent' in document) ? 'textContent' : 'innerText';

        // Example functionality to demonstrate a value feedback
        function valueOutput(element) {
            var value = element.value;
            var output = element.parentNode.getElementsByTagName('output')[0] || element.parentNode.parentNode.getElementsByTagName('output')[0];
            output[textContent] = 'Loan Amount: R' + value;
			
			//Do the calcs
			CalculatePaymentVariables(value);
        }

        $document.on('input', 'input[type="range"], ' + selector, function(e) {
            valueOutput(e.target);
        });

        
        

        // Basic rangeslider initialization
        $element.rangeslider({

            // Deactivate the feature detection
            polyfill: false,

            // Callback function
            onInit: function() {
                valueOutput(this.$element[0]);
            },

            // Callback function
            onSlide: function(position, value) {
                console.log('onSlide');
                console.log('position: ' + position, 'value: ' + value);
            },

            // Callback function
            onSlideEnd: function(position, value) {
                console.log('onSlideEnd');
                console.log('position: ' + position, 'value: ' + value);
            }
        });
		
		

    });
	
	
	function testme(){
		$('input[type="range"]').val(1000).change();
		}
	
function CalculatePaymentVariables(LoanAmount){
	
	//Interest Calcs
	var OneInstalment_Interest = CalculateInterest(LoanAmount,1)
	document.getElementById('OneInstalment_Interest').innerHTML = OneInstalment_Interest;
	
	var TwoInstalment_Interest = CalculateInterest(LoanAmount,2)
   	document.getElementById('TwoInstalment_Interest').innerHTML = TwoInstalment_Interest;
	
	var ThreeInstalment_Interest = CalculateInterest(LoanAmount,3)
   	document.getElementById('ThreeInstalment_Interest').innerHTML = ThreeInstalment_Interest;
	
	//Fees Calcs
   	var OneInstalment_Fees = CalculateFees(LoanAmount,1)
	document.getElementById('OneInstalment_Fees').innerHTML = OneInstalment_Fees;
	
	var TwoInstalment_Fees = CalculateFees(LoanAmount,2)
   	document.getElementById('TwoInstalment_Fees').innerHTML = TwoInstalment_Fees;
	
	var ThreeInstalment_Fees = CalculateFees(LoanAmount,3)
   	document.getElementById('ThreeInstalment_Fees').innerHTML = ThreeInstalment_Fees;
   
	//Total Repayments
	var OneInstalment_TotalRepayment = Number(LoanAmount) + Number(OneInstalment_Interest) + Number(OneInstalment_Fees);
	document.getElementById('OneInstalment_TotalRepayments').innerHTML = OneInstalment_TotalRepayment.toFixed(2);
	
	var TwoInstalment_TotalRepayment = Number(LoanAmount) + Number(TwoInstalment_Interest) + Number(TwoInstalment_Fees);
	document.getElementById('TwoInstalment_TotalRepayments').innerHTML = TwoInstalment_TotalRepayment.toFixed(2);
	
	var ThreeInstalment_TotalRepayment = Number(LoanAmount) + Number(ThreeInstalment_Interest) + Number(ThreeInstalment_Fees);
	document.getElementById('ThreeInstalment_TotalRepayments').innerHTML = ThreeInstalment_TotalRepayment.toFixed(2);
	
	//Instalment
	var OneInstalment_Instalment = OneInstalment_TotalRepayment / 1;
	document.getElementById('OneInstalment_Instalment').innerHTML = OneInstalment_Instalment.toFixed(2);
	
	var TwoInstalment_Instalment = TwoInstalment_TotalRepayment / 2;
	document.getElementById('TwoInstalment_Instalment').innerHTML = TwoInstalment_Instalment.toFixed(2);
	
	var ThreeInstalment_Instalment = ThreeInstalment_TotalRepayment / 3;
	document.getElementById('ThreeInstalment_Instalment').innerHTML = ThreeInstalment_Instalment.toFixed(2);
	
   
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
