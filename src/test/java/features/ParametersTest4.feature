Feature: Parameter Examples

  Background:
    * def demoQABaseURL = "https://bookstore.toolsqa.com"
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"
    
    
    #get the person information whose id is 1

  Scenario: Path parameter with kraft exlab
    Given url kraftBaseURL + "/allusers/getbyid"
    Given path "1"
    When method get
    Then status 200

  Scenario: Path parameter with kraft exlab-2
    Given url kraftBaseURL + "/allusers/getbyid"
    Given path "5"
    When method get
    Then status 200

    #verify all information of user 5 user at one shot
  Scenario: Verify response for fifth user
    * def expectedUser =
    """
    [
    {
        "id": 5,
        "name": "isa akyuz",
        "email": "isaakyuz0811@gmail.com",
        "password": "$2y$10$1l5GsACOln7MYqZLM.OyEuK.BQtI4iU8nBlkXTerzGrSYf8S.1oN6",
        "about": null,
        "terms": "1",
        "date": "2022-09-12 20:50:38",
        "job": null,
        "company": null,
        "website": null,
        "location": null,
        "skills": [],
        "github": null,
        "twitter": null,
        "facebook": null,
        "youtube": null,
        "linkedin": null,
        "instagram": null,
        "avatar": "1",
        "admin": "1",
        "education": [],
        "experience": []
    }
]
    """
    Given url kraftBaseURL + "/allusers/getbyid"
    Given path "5"
    When method get
    Then status 200
    Then match response == expectedUser

    #Send a request for getting all users to kraftexlab and verify status code
  Scenario: Query parameter
      #request
    Given url kraftBaseURL + "/allusers/alluser"
    Given param page = 1
    Given param pagesize = 5
    When method get
      #response
    Then status 200
    Then match header Content-Type == "application/json; charset=UTF-8"
    Then match response[0].job == "Manual Tester"

    #verify that given isbn number is matching that is inside the response body
  #isbn number = 9781449325862
  Scenario: Query parameters-2
    Given def isbnNumber = "9781449325862"
    #request
    Given url demoQABaseURL + "/BookStore/v1/Book"
    Given param ISBN = isbnNumber
    When method get
    #response
    Then status 200
    Then match response.isbn == isbnNumber

    #how to make a verification with a loop
  Scenario: Verification with loop
    Given url demoQABaseURL + '/BookStore/v1/Books'
    When method get
    Then status 200
    Then match each response.books[*].isbn == "#string"