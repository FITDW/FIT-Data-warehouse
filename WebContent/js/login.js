 		function validate() {
        var un = document.loginform.txt_username.value;
        var pw = document.loginform.txt_password.value;
        var username = "parinya"; 
        var password = "parinya";
        if ((un == username) && (pw == password)) {
			alert ("Login was successful");
			window.location = "dashboard.html";
            return false;
       	  }
        else {
            alert ("Login was unsuccessful, please check your username and password");
			window.location = "http://www.google.co.th";
       		 }
        }