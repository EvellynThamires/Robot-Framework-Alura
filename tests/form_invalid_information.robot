*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access the Organo website
Test Teardown     Close the Browser

*** Test Cases ***
Validate if the error message is displayed when the mandatory fields are not filled in 
    Given I click on the create card button 
    Then I should see an error message 

