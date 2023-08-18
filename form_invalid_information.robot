*** Settings ***
Library           SeleniumLibrary
Resource          setup_teardown.robot
Test Setup        Given I access the Organo website
Test Teardown     Close the Browser

*** Variables ***
${form_button}           id:form-botao 

*** Test Cases ***
Validate if the error message is displayed when the mandatory fields are not filled in 
    Given I click on the create card button 
    Then I should see an error message 

*** Keywords ***
Given I click on the create card button 
    Click Element     ${form_button}

Then I should see an error message
    Element Should Be Visible    id:form-nome-erro 
    Element Should Be Visible    id:form-cargo-erro 
    Element Should Be Visible    id:form-times-erro