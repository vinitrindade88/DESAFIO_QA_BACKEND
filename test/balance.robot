Language: Brazilian Portuguese

*** Settings ***
Test Tags   balance
Resource    ../base.resource
Test Setup  Create Session To Sandbox API

*** Test Cases ***
Cenário: Sensibilizar saldo após realização de transações

    Dado que eu esteja autenticado
    Quando eu realizar uma transação interna no valor de 100
    Então a transação deverá ser refletida no meu saldo

