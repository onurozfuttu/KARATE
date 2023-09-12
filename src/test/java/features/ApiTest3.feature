Feature: Basic API tests

  Scenario: Basic status code validation with bookstore
    #request
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get
    #response validation
    Then status 200


  Scenario: Basic status code validation with kraftexlab
    #request
    Given url "https://www.krafttechexlab.com/sw/api/v1/allusers/getbyid/1"
    When method get
    #response validation
    Then status 200

  Scenario: Basic header verification with bookstore
    #request
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get
    #response validation
    Then status 200
    # verify headers
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Connection == "keep-alive"
    #validate that Date exists
    Then match header Date == "#present"

  Scenario: Basic JSON body verification with bookstore
    #request
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method get
    Then status 200
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Connection == "keep-alive"
    Then match header Date == "#present"
    # print response body
    Then print response
    #verify first isbn number
    Then match response.books[0].isbn == "9781449325862"
    #verify second title
    Then match response.books[1].title == "Learning JavaScript Design Patterns"
    #verify that third subtitle exist
    Then match response.books[2].subTitle == "#present"
