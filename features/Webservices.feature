Feature: Validating the USA Zip Code Information Web Service

   Scenario: Verify it contains the expected operations
     When I ask the service for the supported operations
     Then "get_info_by_area_code" should be supported
     And "get_info_by_city" should be supported
     And "get_info_by_state" should be supported
     And "get_info_by_zip" should be supported

     Scenario: Getting the Zip code information by Zip code
       When I ask for zip code information for "43081"
       Then I should see the following
         | city        | state | area_code | time_zone |
         | Westerville | OH    | 614       | E         |