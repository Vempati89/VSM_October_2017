Feature: Process_puppies

  Scenario: Verify message when adoption is processed
    Given I have a pending adoption for "Sai Mallikarjun"
#    with default data
#    Given I have a pending adoption for
    When I process the adoption
    Then I should see "Please thank Sai Mallikarjun for the order!"