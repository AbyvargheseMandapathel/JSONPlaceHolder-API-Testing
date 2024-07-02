
Feature: Validate all regres POST endpoints
	Testing all POST endpoints
	
	Background:
		* def baseurl = "https://reqres.in"



  Scenario: To create a new user 
  
  	* def endpoint = "/api/users"
  
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  And def req_body = {"name": "morpheus", "job": "leader"}
		And request req_body
	  When method post
	  Then status 201
		And print response.name =='morpheus'
		And print "name is validated"
		
		
	Scenario: To login a  user 
	
		* def endpoint = "/api/login"
		
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  And def req_body = {"email": "eve.holt@reqres.in","password": "cityslicka"}

		And request req_body
	  When method post
	  Then status 200
		And match response == 
		"""
		{
    "token": "QpwL5tke4Pnpja7X4"
		}

		"""


Scenario: To create a new user - unsuccessful

		* def endpoint = "/api/login"
		
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  And def payload = {"email": "sydney@fife"}
		And request payload
		And print payload
	  When method post
	  Then status 400
		And match response == 
		"""
		{"error": "Missing password"}
		
		"""

Scenario: To login a  user - unsuccessful

		* def endpoint = "/api/login"
		
	  Given url baseurl
	  And path endpoint
	  And configure ssl = true
	  And def req_body = {"name": "morpheus"}
		And request req_body
	  When method post
	  Then status 400
		
		
		
		
	 