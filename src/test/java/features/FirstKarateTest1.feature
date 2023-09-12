Feature: Welcome to Karate

  #how to print console
  Scenario: How to print
    Given print "Hello World"
    When print 'another print'
    Then print 'only print'

    # * --> represents given when and then
  # ',' --> concetaneating two strings with adding a space
  Scenario: More printing
    Given print "some words to print"
    * print "my name is" + ' karate kid'
    * print "my name is", "karate kid"

    #how to define variable
  # def is common keyboard for all variables(String, Integer, boolean, JSON, ....)
  Scenario: Variables
    * def name = "Mike"
    * print "my name is",name
    * def age = 20
    * print name,"is",age,"years old"


  Scenario: Different objects (json object)
    * def student = {'name':"Onur","owes_tuition":false}
    * print student
    * print student.name
    * print student.owes_tuition

    #how to define a JSON object easily
  @student
  Scenario: JSON object-2
    * def student = 
    """
    {
    "firstname": 'John',
    "lastname": 'Cena',
    "salary": 50000
    }
    """
    * print student

  Scenario: JSON object-3
    * def gorestUser =
    """
    {
        "id": 5104288,
        "name": "Saroja Khanna",
        "email": "saroja_khanna@lind-robel.example",
        "gender": "male",
        "status": "active"
    }
    """
    * print gorestUser
    * print gorestUser.id
    * print gorestUser.name
    * print gorestUser.email
    * print gorestUser.gender
    * print gorestUser.status

  Scenario: JSON array objects
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
    * print students
      #how to reach firstname
    * print students[0].name
      #how to reach second salary
    * print students[1].salary