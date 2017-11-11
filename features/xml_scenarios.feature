Feature: using xml in my cukes

  Scenario: find the number of sitcoms and dramas
    When I open my shows xml
    Then I should see 2 sitcoms
    And I should see 1 drama

  Scenario: Validate the phone number of a contact in the list
    Given I have the list
        | name     | phone      |
        | Parimala | 4845105599 |
        | Arjun    | 6148151096 |
        | Srikant  | 4696887640 |
        | Sam      | 6144466124 |
        | Ravi     | 7893930030 |
    When I select "Parimala"
    Then I should see the phone number "4845105599"
