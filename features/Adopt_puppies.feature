Feature: Adopting puppies

  Background:
    Given I am on the puppy adoption site

    Scenario: Name is a required field
      When I Checkout leaving the name field blank
      Then I should see the error message "Name can't be blank"


    Scenario: Thank you message should be displayed
      When I complete the adoption of a puppy
      Then I should see "Thank you for adopting a puppy!"

      Scenario: Adopting a puppy using partial data
        When I click the View Details button for "Brook"
        And I click on Adopt me button
        And I click on Complete adoption button
        And I complete the adoption using a credit card
        Then I should see "Thank you for adopting a puppy!"

    Scenario: Adopting a puppy using all default data
    When I click the View Details button for "Hanna"
    And I click on Adopt me button
    And I click on Complete adoption button
    And I complete the adoption
    Then I should see "Thank you for adopting a puppy!"


    Scenario: Adopting a puppy using a table
      When I click the View Details button for "Maggie Mae"
      And I click on Adopt me button
      And I click on Complete adoption button
      And I complete the adoption with:
        | name     | address            | email                | pay_type    |
        | Parimala | 6351 OverBrook Ave | pari104@testmail.com | Credit card |
      Then I should see "Thank you for adopting a puppy!"

    Scenario: Adopt a Puppy
      When I click the View Details button for "Hanna"
      And I click on Adopt me button
      And I click on Complete adoption button
      And I enter "Sai Mallikarjun" in the Name field
      And I enter "8290 Neilston Crossing Dr" in the address field
      And I enter "svm@testmail.com" in the email field
      And I select "Check" from the pay type drop down
      And I click on Place Order button
      Then I should see "Thank you for adopting a puppy!"

  Scenario Outline: Adopting a puppy
    When I click the View Details button for "Brook"
    And I click on Adopt me button
    And I click on Complete adoption button
    And I enter "<name>" in the Name field
    And I enter "<address>" in the address field
    And I enter "<email>" in the email field
    And I select "<pay_type>" from the pay type drop down
    And I click on Place Order button
   Then I should see "Thank you for adopting a puppy!"
    Examples:
      | name    | address               | email                 | pay_type       |
      | Arjun   | 8396 Gradington Dr    | vempati89@example.com | Check          |
      | Samuel  | 566 HeatherBrooke way | samuelhup@example.com | Credit card    |
      | Srikant | 370 S Cleveland Ave   | srikant@testmail.com  | Purchase order |

  Scenario: Adopting two puppies
   When I click the View Details button for "Brook"
   And I click on Adopt me button
   And I click the Adopt Another Puppy button
   And I click the View Details button for "Hanna"
   And I click on Adopt me button
   And I click on Complete adoption button
   And I enter "Arjun" in the Name field
   And I enter "8396 Gradington Dr" in the address field
   And I enter "vempati89@outlook.com" in the email field
   And I select "Credit card" from the pay type drop down
   And I click on Place Order button
   Then I should see "Thank you for adopting a puppy!"


  Scenario: Validate shopping cart with one puppy
    When I click the View Details button for "Hanna"
    And I click on Adopt me button
    Then I should see "Hanna" as the name for line item 1
    And I should see "$22.99" as the subtotal for line item 1
    And I should see "$22.99" as the cart total

  Scenario: Validate shopping cart with two puppies
    When I click the View Details button for "Maggie Mae"
    And I click on Adopt me button
    And I click the Adopt Another Puppy button
    And I click the View Details button for "Hanna"
    And I click on Adopt me button
    Then I should see "Maggie Mae" as the name for line item 1
    And I should see "$14.95" as the subtotal for line item 1
    And I should see "Hanna" as the name for line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$37.94" as the cart total

