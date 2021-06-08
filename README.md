
1.	The applicant lands on the amabuzz page and is required to register
Not required to register when viewing site. Only required to register if user wants to apply.
2.	Once registered, he logs in and completes the application. 
If user is already registered, he can either login and then select his loan requirement from the slider, or user can select loan and when he clicks apply, it will ask to either register an account or login if already registered.
3.	If he is already registered, he logs in and any data captured previously is populated on the form.
If user is registered and not applying for a new loan ie. wants to continue a previous loan application, then he should be presented with a list of loan apps, and he can select one and continue. Ideally you want them to start application again because the loan repayment schedule differs based on what day they applying.
4.	Once his personal information is captured (saved to the database), we do a Compuscan call. 
a.	If he meets the credit criteria from Compuscan, he continues and completes the rest of the form
b.	If not, we end the application process with a suitable message indicating the reason why he’s been declined but we retain his data for future use
5.	The completed application is then sent to Calidad’s endpoint




# amaBuzzWebFrontend
Front End for the web front end (application) for AmaBuzz
