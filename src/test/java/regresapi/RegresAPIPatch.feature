Feature: Validate PUT endpoints 
	Testing all endpoints
	
		Background:
		* def baseurl = "https://reqres.in"
	
	Scenario: Update user via API
	
		* def endpoint =  "/api/users/2"
		
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  And request {"name": "morpheus", "job": "zion resident"}
	  When method put
	  Then status 200