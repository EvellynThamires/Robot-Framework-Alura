*** Settings ***
Library    SeleniumLibrary 

*** Test Cases ***
Open browser and access the organo's website
    Open Browser    url=http://localhost:3000/    browser=Chrome

Fill in the form fields
    Input Text        id:form-nome            Akemi
    Input Text        id:form-cargo           Desenvolvedora
    Input Text        id:form-imagem          https://picsum.photos/200/300
    Click Element     class:lista-suspensa
    Click Element     //option[contains(.,'Programação')]
    Sleep             5s
    Click Element     id:form-botao   

    Element Should Be Visible    class:colaborador        
    Sleep             5s