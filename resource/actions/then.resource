*** Settings ***
Resource    ../../base.resource

*** Keywords ***
a transação deverá ser refletida no meu saldo
    Get Balance
    Assert Get Balance

a transação deverá ser refletida no meu extrato
    Get Statements
    Assert Get Statements

a transação deverá ser criada com sucesso
    Assert Post Dry Run Internal Transfers