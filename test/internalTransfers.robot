Language: Brazilian Portuguese

*** Settings ***
Test Tags   internalTransfers
Resource    ../base.resource
Test Setup  Create Session To Sandbox API

*** Test Cases ***
Cenário: Criar transação interna

    Dado que eu esteja autenticado
    Quando eu realizar uma transação interna no valor de 100
    Então a transação deverá ser criada com sucesso
