<!DOCTYPE html>
<html lang="en">

<%
'Loan Constants
Minimum_Loan = "500"
Maximum_Loan = "3000"
Default_Loan = "1700"
Default_Loan_Length_1 = ""
Default_Loan_Length_2 = "checked"
Default_Loan_Length_3 = ""
Interest_Rate_pm = "0.00"
Monthly_Fee = "60"
Initiation_Fee = "165"
VAT_Rate = "0.15"


%>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Amabuzz</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  <!-- Template Slider CSS File -->
  <link href="assets/slider/rangeslider.css" rel="stylesheet">

  
  <!-- =======================================================
  * Template Name: Mentor - v2.1.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html">amabuzz</a><img src="assets/img/bee_trail.png" height="23" border="0" alt=""></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="">Home</a></li>
          <li><a href="#why-us">How it works</a></li>
          <li><a href="#about">About us</a></li>
          <li><a href="#contact">Contact us</a></li>
        </ul>
      </nav><!-- .nav-menu -->

      <a href="courses.html" class="get-started-btn">Login</a>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex justify-content-center align-items-center">
  	<div class="container" data-aos="fade-up">  
	  	<div class="row">
		    <div class="col-lg-6 container position-relative d-none d-lg-block" data-aos="zoom-in" data-aos-delay="100">
		      <h1>NEED HONEY,</h1>
			  <h1>NO MONEY?</h1>
		      <h2>Apply online and get approved in minutes.</h2>
			  <h4>You will need to have:</h4>
			  <div class="row">
			  	<div class="col-lg-6">
				      <ul>
						  <li><i class="icofont-check-circled"></i> a valid mobile number</li>
						  <li><i class="icofont-check-circled"></i> a valid email address</li>
						  <li><i class="icofont-check-circled"></i> verifiable income for the last 3 months</li>
					  </ul>
				</div>
				<div class="col-lg-6">
				      <ul>
						  <li><i class="icofont-check-circled"></i> a bank account</li>
						  <li><i class="icofont-check-circled"></i> an SA ID number</li>
					  </ul>
				</div>
              </div>
 
		      <!-- <a href="courses.html" class="btn-get-started">Get Started</a> -->
		    </div>
			<div class="col-lg-6 loan-calculator" align="center" data-aos="zoom-in" data-aos-delay="100">
			  <%IF Interest_Rate_pm * 1 = 0 THEN%>
			  <span class="advanced">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0% Interest!</span>
			  <%END IF%>
			  <h1 class="d-block d-lg-none d-xl-none">NEED HONEY,<br>NO MONEY?</h1>
		      <h2>How much do you need to borrow?</h2>
			  <h1><output></output></h1>
			  
			  <div class="row">
			  	<div class="col text-white" align="left">R<%=Minimum_Loan%></div>
				<div class="col text-white" align="right">R<%=Maximum_Loan%></div>
			  </div>
			  <input type="hidden" name="LoanAmount" id="LoanAmount" value="<%=Default_Loan%>">
			  <input type="hidden" id="InterestRatePM" value="<%=Interest_Rate_pm%>"/>
			  <input type="hidden" id="MonthlyFee" value="<%=Monthly_Fee%>"/>
			  <input type="hidden" id="InitiationFee" value="<%=Initiation_Fee%>"/>
			  <input type="hidden" id="VATRate" value="<%=VAT_Rate%>"/>
			  
		      <input type="range" value="<%=Default_Loan%>" min="<%=Minimum_Loan%>" max="<%=Maximum_Loan%>" step="50" data-orientation="horizontal" data-rangeslider>
	          <br>
			  
			  <div class="row">
			  	<div class="col" align="center">
					<h3>Choose your loan length</h3>
					<div class="btn-group btn-group-toggle w-100" data-toggle="buttons" onClick="CalculatePaymentVariables('0');">
					  <label class="btn btn-loan-length-1">
					    <input type="radio" name="loan-length" id="loan-length" value="1" autocomplete="off" <%=Default_Loan_Length_1%>> <i class="bx bx-check-circle bx-sm white checked"></i><i class="bx bx-circle white unchecked"></i><span class="loan-length-font">&nbsp;1 month&nbsp;</span><br><span class="instalment-font">R<a id="OneInstalment_Instalment"></a>pm</span>
					  </label>
					  <label class="btn btn-loan-length-1 active">
					    <input type="radio" name="loan-length" id="loan-length" value="2" autocomplete="off" <%=Default_Loan_Length_2%>> <i class="bx bx-check-circle bx-sm white checked"></i><i class="bx bx-circle white unchecked"></i><span class="loan-length-font">&nbsp;2 months</span><br><span class="instalment-font">R<a id="TwoInstalment_Instalment"></a>pm</span>
					  </label>
					  <label class="btn btn-loan-length-1">
					    <input type="radio" name="loan-length" id="loan-length" value="3" autocomplete="off" <%=Default_Loan_Length_3%>> <i class="bx bx-check-circle bx-sm white checked"></i><i class="bx bx-circle white unchecked"></i><span class="loan-length-font">&nbsp;3 months</span><br><span class="instalment-font">R<a id="ThreeInstalment_Instalment"></a>pm</span>
					  </label>
					</div>
				</div>
              </div>
			  
			  <div class="row loan-details">
			  	<div class="col-4" align="center">
					Interest<br>R<a id="Interest"></a>
				</div>
				<div class="col-3" align="center">
					Fees<br>R<a id="Fees"></a>
				</div>
				<div class="col-5" align="center">
					Total repayment<br>R<a id="TotalRepayment"></a>
				</div>
			  </div>
			  
			  
			  <div class="row">
			  	<div class="col">
                	<a href="about.html" class="btn-apply-now">APPLY NOW!</a>
				</div>
              </div>
			  
			  <div class="row">
			  	<div class="col loan-disclaimer">
					The above example is illustrative only and includes interest at <%=ROUND(Interest_Rate_pm*100, 2)%>% pm, an initial fee of R165 plus 10% of the amount over R1000, and monthly fees of R60pm pro-rated for the first month, plus <%=VAT_Rate*100%>% VAT on the fees. 
					The example is also based on the assumption that repayments are made on time as per the original loan contract terms otherwise other fees and charges are payable.
					
				</div>
              </div>
			  
		    </div>
			
		</div>
	</div>
  </section><!-- End Hero -->

  <main id="main">
    
   <!-- ======= Covid-19 Section ======= -->
    <section id="covid19" class="covid19">
      <div class="container" data-aos="fade-up">
	  		<a href="https://sacoronavirus.co.za" target="_blank" class="more-btn"><b>COVID-19</b>. Visit the SA Corona Virus portal for COVID-19 updates!</a>
      </div>
    </section><!-- End Covid-19 -->
	
   <!-- ======= What you need Section ======= -->
    <section id="whatyouneed" class="d-flex justify-content-center align-items-center d-block d-lg-none d-xl-none">
      <div class="container" data-aos="fade-up">

       	<h1>Apply online and get approved in minutes.</h1>
		<h2>You will need to have:</h2>
			  <ul>
				  <li><i class="icofont-check-circled"></i> a valid mobile number</li>
				  <li><i class="icofont-check-circled"></i> a valid email address</li>
				  <li><i class="icofont-check-circled"></i> verifiable income for the last 3 months</li>
				  <li><i class="icofont-check-circled"></i> a bank account</li>
				  <li><i class="icofont-check-circled"></i> an SA ID number</li>
			  </ul>
				

      </div>
    </section><!-- What you need Section -->


    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="content">
              <h3>How it works?</h3>
              <p>
                Almost anybody with a steady income can apply for a loan. You can submit your application online 24 hours, 7 days a week. 
				Once approved, we will instantly transfer your funds. It's in our DNA to make it happen!
              </p>
              <div class="text-center">
                <a href="about.html" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-receipt"></i>
                    <h4>1. Effortless Application</h4>
                    <p>Our loan application takes about 5 minutes to complete. We have made the process simple and effortless.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-cube-alt"></i>
                    <h4>2. Fast Processing</h4>
                    <p>Once submitted, your application will be assessed and vetted. We may ask you for some additional documents.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-money"></i>
                    <h4>3. Money Honey, Money!</h4>
                    <p>Upon approval of your application and your Debicheck debit order, your money will be transferred. Happy Shopping!</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Why Us Section -->
	

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts section-bg">
      <div class="container">

        <div class="row counters">
		
		  <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"><%=Maximum_Loan%></span>
            <p>Max 1st loan</p>
          </div>
		  
          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">6000</span>
            <p>Max 2nd loan</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"><%=ROUND(Interest_Rate_pm*100, 2)%></span>
            <p>% Interest Rate pm</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">3</span>
            <p>Months to pay</p>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->
	
	
	<!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>About</h2>
          <p>About Us</p>
        </div>

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <img src="assets/img/boardroom.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
            <p class="font-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p>
            <ul>
              <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              <li><i class="icofont-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
              <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
            </ul>
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
	
	<!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
		
		<div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>
		
        <div class="row mt-5">

          <div class="col-lg-4">

            <div class="info">
			  <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>087 123 4567 (Mon-Fri 8am-5pm)</p>
              </div>
			  
			  <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p><a href="mailto:info@amabuzz.co.za">help@amabuzz.co.za</a></p>
              </div>
			  
			  <div class="whatsapp">
                <i class="icofont-whatsapp"></i>
                <h4>WhatsApp:</h4>
                <p><a href="https://wa.me/1XXXXXXXXXX?text=Hi">082 000 0000&nbsp;&nbsp;(Click to WhatsApp us)</a></p>
              </div>
			  
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>1st Floor, 39 Somerset Road, Green Point, Cape Town</p>
              </div>
              
            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
	
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-md-6 footer-links">
            <h3>Useful Links</h3>
            <ul class="list-unstyled list-columns">
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
			  <li><i class="bx bx-chevron-right"></i> <a href="#">Login</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">How it works</a></li>
			  <li><i class="bx bx-chevron-right"></i> <a href="#">Help</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Contact us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>
		  
		  <div class="col-lg-6 col-md-6 footer-newsletter" align="center">
			 <img src="assets/img/NCR_Logo.png" width="127" height="66" border="0" alt="">
             <p>Amabuzz is a registered credit provider, NCRCP13773</p>
            <br>
			<div class="social-links text-center text-md-right pt-3 pt-md-0 justify-content-center">
		        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
		        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
		        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
		        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
		        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
		      </div>
			
          </div>
		  
          <!-- 
		  <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div> 
		  -->

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
        <div class="copyright">
          &copy; Copyright <strong><span>Amabuzz</span></strong>. All Rights Reserved.
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          
        </div>
      </div>
      
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  <!-- Template Slider JS File -->
  <script src="assets/slider/rangeslider.js"></script>

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
            output[textContent] = 'R' + value;
			
			//Do the calcs
			CalculatePaymentVariables(value);
			document.getElementById('LoanAmount').value = value;
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
	
	
	
function CalculatePaymentVariables(LoanAmount){
	
	if (LoanAmount == "0"){
		var LoanAmount = document.getElementById('LoanAmount').value
		}
	
	var LoanLength = document.querySelector('input[id = loan-length]:checked').value;
	
	//Interest Calcs
	var Interest = CalculateInterest(LoanAmount,LoanLength)
	document.getElementById('Interest').innerHTML = Interest;
	
	var OneInstalment_Interest = CalculateInterest(LoanAmount,1)
	var TwoInstalment_Interest = CalculateInterest(LoanAmount,2)
	var ThreeInstalment_Interest = CalculateInterest(LoanAmount,3)
	
	//Fees Calcs
	var Fees = CalculateFees(LoanAmount,LoanLength)
	document.getElementById('Fees').innerHTML = Fees
	
   	var OneInstalment_Fees = CalculateFees(LoanAmount,1)
	var TwoInstalment_Fees = CalculateFees(LoanAmount,2)
	var ThreeInstalment_Fees = CalculateFees(LoanAmount,3)
   
	//Total Repayments
	var TotalRepayment = Number(LoanAmount) + Number(Interest) + Number(Fees);
	document.getElementById('TotalRepayment').innerHTML = TotalRepayment.toFixed(2);
	
	var OneInstalment_TotalRepayment = Number(LoanAmount) + Number(OneInstalment_Interest) + Number(OneInstalment_Fees);
	var TwoInstalment_TotalRepayment = Number(LoanAmount) + Number(TwoInstalment_Interest) + Number(TwoInstalment_Fees);
	var ThreeInstalment_TotalRepayment = Number(LoanAmount) + Number(ThreeInstalment_Interest) + Number(ThreeInstalment_Fees);
	
	//Instalment
	var OneInstalment_Instalment = OneInstalment_TotalRepayment / 1;
	document.getElementById('OneInstalment_Instalment').innerHTML = Math.floor(OneInstalment_Instalment);
	
	var TwoInstalment_Instalment = TwoInstalment_TotalRepayment / 2;
	document.getElementById('TwoInstalment_Instalment').innerHTML = Math.floor(TwoInstalment_Instalment);
	
	var ThreeInstalment_Instalment = ThreeInstalment_TotalRepayment / 3;
	document.getElementById('ThreeInstalment_Instalment').innerHTML = Math.floor(ThreeInstalment_Instalment);
	
   
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