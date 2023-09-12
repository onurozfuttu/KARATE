Feature: Post Method + Karate/Java Integration

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario: Register a new user with Kraft
    Given url kraftBaseURL + "/allusers/register"
    Given request
    """
    {
  "name": "test10001",
  "email": "test10001@krafttechexlab.com",
  "password": "123467"
    }
    """
    When method post
    Then status 200
    Then print response

  Scenario: Register a new user with the help of Java
    #point the class that we want to run
    #Java.type --> used to connect to java class
    Given def KDG = Java.type("utilities.KraftDataGenerator")
    Given def newUser = KDG.createUser()
    #request
    Given url kraftBaseURL + "/allusers/register"
    Given request newUser
    When method post
    #response
    Then status 200
    Then match newUser.name == response.name
    Then match newUser.email == response.email