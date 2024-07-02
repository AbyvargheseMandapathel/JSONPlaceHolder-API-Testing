
Feature: Validate all regres GET endpoints
	Testing all endpoints
	
		Background:
		* def baseurl = "https://reqres.in"
	
  #Scenario: To check get single user api
    #Given url  "https://reqres.in/api/users/2"
    #And configure ssl = true
    #And configure ssl = {	trustAll : true}
    #When method get
    #Then status 200
    
    
  Scenario: To check get single user api
  
  	* def endpoint = "/api/users/2"
    Given url  baseurl
    And path endpoint
    And configure ssl = true
    #And configure ssl = {	trustAll : true}
    When method get
    Then status 200
    
   
    
   Scenario: To list All Users
   
   * def endpoint = "/api/users"
   
    Given url  baseurl
    #And path '/api/users?page=2'
    And path endpoint
    And param page = '2'
    And configure ssl = true
    #And configure ssl = {	trustAll : true}
    When method get
    Then status 200
    And match response ==
    
    """
    {
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": 7,
            "email": "michael.lawson@reqres.in",
            "first_name": "Michael",
            "last_name": "Lawson",
            "avatar": "https://reqres.in/img/faces/7-image.jpg"
        },
        {
            "id": 8,
            "email": "lindsay.ferguson@reqres.in",
            "first_name": "Lindsay",
            "last_name": "Ferguson",
            "avatar": "https://reqres.in/img/faces/8-image.jpg"
        },
        {
            "id": 9,
            "email": "tobias.funke@reqres.in",
            "first_name": "Tobias",
            "last_name": "Funke",
            "avatar": "https://reqres.in/img/faces/9-image.jpg"
        },
        {
            "id": 10,
            "email": "byron.fields@reqres.in",
            "first_name": "Byron",
            "last_name": "Fields",
            "avatar": "https://reqres.in/img/faces/10-image.jpg"
        },
        {
            "id": 11,
            "email": "george.edwards@reqres.in",
            "first_name": "George",
            "last_name": "Edwards",
            "avatar": "https://reqres.in/img/faces/11-image.jpg"
        },
        {
            "id": 12,
            "email": "rachel.howell@reqres.in",
            "first_name": "Rachel",
            "last_name": "Howell",
            "avatar": "https://reqres.in/img/faces/12-image.jpg"
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
    """
    
    
   Scenario: To validate single user not found
   
   * def endpoint = '/api/users/23'
   
    Given url  baseurl
    And path endpoint
    And configure ssl = true
    #And configure ssl = {	trustAll : true}
    When method get
    Then status 404
    
    
   Scenario: To validate list resource
   
   * def endpoint = "/api/unknown"
   
    Given url  baseurl
    And path endpoint
    And configure ssl = true
    When method get
    Then status 200

    
    Scenario: To validate Single resource
    
    * def endpoint = "/api/unknown/2"
    
    Given url baseurl
    And path endpoint
    And configure ssl = true
    When method get
    Then status 200
    And match response == 
    """  
    {
    "data": {
        "id": 2,
        "name": "fuchsia rose",
        "year": 2001,
        "color": "#C74375",
        "pantone_value": "17-2031"
    },
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
"""


Scenario: To validate Single resource not found

   * def endpoint = "/api/unknown/23"
    Given url  baseurl
    And path endpoint
    And configure ssl = true
    When method get
    Then status 404
    
    
Scenario: To verify delayed users

		* def endpoint = "/api/users"
    Given url  baseurl
    And path endpoint
    And param delay = '3'
    And configure ssl = true
    #And configure ssl = {	trustAll : true}
    When method get
    Then status 200
    And match response == 
    """   
    {
    "page": 1,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": 1,
            "email": "george.bluth@reqres.in",
            "first_name": "George",
            "last_name": "Bluth",
            "avatar": "https://reqres.in/img/faces/1-image.jpg"
        },
        {
            "id": 2,
            "email": "janet.weaver@reqres.in",
            "first_name": "Janet",
            "last_name": "Weaver",
            "avatar": "https://reqres.in/img/faces/2-image.jpg"
        },
        {
            "id": 3,
            "email": "emma.wong@reqres.in",
            "first_name": "Emma",
            "last_name": "Wong",
            "avatar": "https://reqres.in/img/faces/3-image.jpg"
        },
        {
            "id": 4,
            "email": "eve.holt@reqres.in",
            "first_name": "Eve",
            "last_name": "Holt",
            "avatar": "https://reqres.in/img/faces/4-image.jpg"
        },
        {
            "id": 5,
            "email": "charles.morris@reqres.in",
            "first_name": "Charles",
            "last_name": "Morris",
            "avatar": "https://reqres.in/img/faces/5-image.jpg"
        },
        {
            "id": 6,
            "email": "tracey.ramos@reqres.in",
            "first_name": "Tracey",
            "last_name": "Ramos",
            "avatar": "https://reqres.in/img/faces/6-image.jpg"
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
}
"""
    
    

   