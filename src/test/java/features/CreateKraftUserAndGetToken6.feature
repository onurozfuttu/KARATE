Feature: Get user token

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario: Create a new user with Java and get token
    #request
    Given def KDG = Java.type("utilities.KraftDataGenerator")
    Given def newUser = KDG.createUser()
    Given url kraftBaseURL + "/allusers/register"
    Given request newUser
    When method post
    #response
    Then status 200
    Then match newUser.name == response.name
    Then match newUser.email == response.email
    Then match response.id == "#number"
    #get token
    Then def token = response.token