*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary                        locale=pt_BR
Resource          setup_teardown.robot
Test Setup        Given I access the Organo website
Test Teardown     Close the Browser

*** Variables ***
${name_field}            id:form-nome
${role_field}            id:form-cargo
${form_image}            id:form-imagem
${team_select_field}     class:lista-suspensa
${form_button}           id:form-botao 

@{select_team}
...                      //option[contains(.,'Programação')]
...                      //option[contains(.,'Front-End')]
...                      //option[contains(.,'Data Science')]
...                      //option[contains(.,'Devops')]
...                      //option[contains(.,'UX e Design')]
...                      //option[contains(.,'Mobile')]
...                      //option[contains(.,'Inovação')]

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

*** Keywords ***

Given I fill in the form with valid information
    ${name}           FakerLibrary.First Name
    ${role}           FakerLibrary.Job
    ${image}          FakerLibrary.Image Url  width=100     height=100  

    Input Text        ${name_field}           ${name}
    Input Text        ${role_field}           ${role}
    Input Text        ${form_image}           ${image}
    Click Element     ${team_select_field}
    Click Element     ${select_team}[0]

When I click in the create card button
    Click Element     ${form_button}
Then I should be able to see the card in the expected section
    Element Should Be Visible    class:colaborador   

Then it should create three cards in the correct team
    FOR    ${counter}    IN RANGE    1    3
        Given I fill in the form with valid information
        When I click in the create card button
    END

Then it should create a card on a team
    FOR    ${index}    ${team}    IN ENUMERATE    @{select_team}
        Given I fill in the form with valid information
        Click Element  ${team}
        When I click in the create card button
    END