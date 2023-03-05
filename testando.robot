*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary

*** Variables ***
#Dados do teste
${FirstName}    Wesley 
${LastName}     Amorim   
${Email}        fagwes@hotmail.com
${Mobile}       1963608531
${Current}      Guarulhos

#Variaveis de configuracao
${url}    https://demoqa.com/automation-practice-form
${brownser}    chrome   
     
#Elementos

${input_firstname}                 xpath= //*[@id="firstName"]
${input_lastname}                  xpath= //*[@id="lastName"]
${input_email}                     xpath= //*[@id="userEmail"]
${input_mobile}                    xpath= //*[@id="userNumber"]
${input_current}                   xpath= //*[@id="currentAddress"]


${buttons_gender}                  xpath= //*[@id="genterWrapper"]/div[2]/div[1]
${buttons_hobbies}                 xpath= //*[@id="hobbiesWrapper"]/div[2]/div[1]/label
${buttons_dateOfBirth}             xpath= //*[@id="dateOfBirthInput"]
${buttons_dateOfBirth17}           xpath= //*[@id="dateOfBirth"]/div[2]/div[2]/div/div/div[2]/div[1]/div[1] 

*** Keywords ***
Given que eu esteja no site do DemoQA
    Open Browser    ${url}        ${brownser}    
    Maximize Browser Window
    Start Gif Recording

When digito os dados nas lacunas 
    Input Text    ${input_firstname}        ${FirstName}
    Input Text    ${input_lastname}         ${LastName}
    Input Text    ${input_email}            ${Email}
    Input Text    ${input_mobile}           ${Mobile}      
    Input Text    ${input_current}          ${Current}
    
And clico nos botoes
    Wait Until Element Is Visible    ${buttons_gender} 
    Click Element                    ${buttons_gender}    
      
    Wait Until Element Is Visible    ${buttons_hobbies}
    Click Element                    ${buttons_hobbies}

    Wait Until Element Is Visible    ${buttons_dateOfBirth}  
    Click Element                    ${buttons_dateOfBirth}     
      
    Wait Until Element Is Visible    ${buttons_dateOfBirth17}
    Click Element                    ${buttons_dateOfBirth17}
   
And clico no botao registro
   Submit Form

Then registro realizado com sucesso
    Close Browser
    Stop Gif Recording

*** Test Cases ***
Cenario 1: registro de usuário no site DemoQA
    Given que eu esteja no site do DemoQA
    When digito os dados nas lacunas 
    And clico nos botoes
    And clico no botao registro
    Then registro realizado com sucesso


    
