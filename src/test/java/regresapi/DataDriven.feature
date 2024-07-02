Feature: Data Driven testing
  
  Scenario Outline: To check the endpoint for multiple users.
    Given url "https://reqres.in"
    And path "/api/users"
    And configure ssl = true
  	And  request { name: '<name>', job: '<job>' }
  	When method post
  	Then status 201

    Examples: 
      | name  |     job  |
      | user1 |     job1 |
      | user2 |     job2 |
