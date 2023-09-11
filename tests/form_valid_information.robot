*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access the Organo website
Test Teardown     Close the Browser

*** Test Cases ***
Validate when inserting valid information if the card is created in the expected section
    Given I fill in the form with valid information 
    When I click in the create card button 
    Then I should be able to see the card in the expected section

Validate creating more than one card 
    Given I fill in the form with valid information 
    When I click in the create card button 
    Then it should create three cards in the correct team

Validate when creating cards in different teams
    Given I fill in the form with valid information 
    Then it should create a card on a team
