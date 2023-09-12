Feature: Data Tests

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"


  Scenario: Get all users with kraft
    #request
    Given url kraftBaseURL + "/allusers/alluser"
    Given param page = 1
    Given param pagesize = 10
    When method get
    #response
    * def expectedResponse = read("data/users.json")
    Then match response == expectedResponse


