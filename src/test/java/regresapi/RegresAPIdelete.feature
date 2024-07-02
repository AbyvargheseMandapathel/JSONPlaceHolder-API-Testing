Feature: Validate DELETE endpoints 
	Testing all endpoints
   
   
   Background:
	* def baseurl = "https://reqres.in"
   
   
  Scenario: Delete user via API
  
  	* def endpoint = "/api/users/2"
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  When method delete
	  Then status 204