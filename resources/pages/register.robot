*** Settings ***
Resource    ../main.robot

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

Given I click on the create card button 
    Click Element     ${form_button}

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

Then I should see an error message
    Element Should Be Visible    id:form-nome-erro 
    Element Should Be Visible    id:form-cargo-erro 
    Element Should Be Visible    id:form-times-erro