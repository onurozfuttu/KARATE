Feature: Assertion by using match keyword

  #how to make assertions with KARATE
  Scenario: Some matching example
    * def name = "Ayse"
    * match name == "Ayse"
    * match name != "Francesko"

  Scenario: More matching example
    * def employee =
    """
    {
    "firstname" : 'Hasan',
    "lastname": 'Yıldırım',
    "salary": 55000,
    "active": true
    }
    """
    * match employee.firstname == "Hasan"
    * match employee.lastname == "Yıldırım"
    * match employee.salary == 55000
    * match employee.active == true

  Scenario: Fuzzy matching
    * def employee =
    """
    {
    "firstname" : 'Hasan',
    "lastname": 'Yıldırım',
    "salary": 55000,
    "active": true
    }
    """
    * match employee.firstname == "#string"
    * match employee.lastname == "#string"
    * match employee.salary == "#number"
    * match employee.active == "#boolean"
    # present --> firstname diye bir key var mı?
    * match employee.firstname == "#present"
    # notpresent --> gender diye bir key yok mu?
    * match employee.gender == "#notpresent"

  Scenario: Contains matching
    * def students =
      """
      [
      {
      "name": 'Tina',
      "salary": 25000
      },
      {
      "name": 'Tony',
      "salary": 30000
      }
      ]
      """
    # how to verify length of array
    * def lengthOfArray = students.length
    * match lengthOfArray == 2
    # how to check if array contains a specific element
    * match students contains {"name":"Tina","salary":25000}

  Scenario: Contains matching-2
    * def arr = ["Serkan","Suad","Ziya","Uğur"]
    * print arr
    * match arr contains "Serkan"
    * match arr !contains "Eren"
