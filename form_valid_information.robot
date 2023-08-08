*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${name_field}            id:form-nome
${role_field}            id:form-cargo
${form_image}            id:form-imagem
${team_select_field}     class:lista-suspensa
${form_button}           id:form-botao 
${development}           //option[contains(.,'Programação')]
${front_end}             //option[contains(.,'Front-End')]
${data}                  //option[contains(.,'Dados')]
${devops}                //option[contains(.,'Devops')]
${ux}                    //option[contains(.,'UX e Design')]
${mobile}                //option[contains(.,'Mobile')]
${inovation}             //option[contains(.,'Inovação')]

*** Test Cases ***
Validate when inserting valid information, if the card is created in the expected section
    Given I access the Organo website
    When I fill in the form with valid information 
    And I click in the create card button 
    Then I should be able to see the card in the expected section

*** Keywords ***
Given I access the Organo website
    Open Browser      url=http://localhost:3000/    browser=Chrome

When I fill in the form with valid information
    Input Text        ${name_field}           Akemi
    Input Text        ${role_field}           Desenvolvedora
    Input Text        ${form_image}           https://picsum.photos/200/300
    Click Element     ${team_select_field}
    Click Element     ${development}

And I click in the create card button
    Click Element     ${form_button}
Then I should be able to see the card in the expected section
    Element Should Be Visible    class:colaborador   