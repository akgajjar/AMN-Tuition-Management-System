$().ready(function() {
	 

	
	$("#empatt").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			designation : {
				required : true,
				
			},
			
			date : {
				required : true,
				
			}
		},
		messages : {
			designation : {
				required : "Please Select Designation."
					
			},
		
			date : {
				required : "Please Select Attendance Date.",
			
			}
		}

	
	});

	$("#removeempatt").validate({
		onfocusout: function(element) {
	         this.element(element);
	      },
	      
		rules : {
			designation : {
				required : true,
				
			},
			
			date : {
				required : true,
				
			}
		},
		messages : {
			designation : {
				required : "Please Select Designation."
					
			},
		
			date : {
				required : "Please Select Attendance Date.",
			
			}
		}

	
	});

	
	$.validator.addMethod("OnlyAlpha", function(value, element) {
		return /^[A-Za-z]+$/.test(value);
	}, "Please Alpha Characters Only.");
	$.validator.addMethod("username", function(value, element) {
		return /^[A-Za-z0-9_.@#]+$/.test(value);
	}, "Please Enter a Valid Username.");
	$.validator.addMethod("email_add", function(value, element)
	{
		return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,3}$/i.test(value);
	}, "Please enter a valid email address.");
	$.validator.addMethod("mobile_no",function(value,element)
			{
				return this.optional(element) || /^[9876]\d{9}$/i.test(value);
			},"Enter a Valid 10 Digit Indian Mobile No.");
	$.validator.addMethod("aadhar",function(value,element)
			{
				return this.optional(element) || /^[0-9]{12}$/i.test(value);
			},"Enter a Valid Aadhar Card Number");
	$.validator.addMethod("onlydigit",function(value,element)
			{
				return this.optional(element) || /^[0-9]{1,9}$/i.test(value);
			},"Only Digits are Allowed.");
	$.validator.addMethod("password",function(value,element)
	{
		return this.optional(element) || /^[A-Za-z0-9!@#$%^&*()_]{6,16}$/i.test(value);
	},"Passwords are 6-16 characters");
});    
