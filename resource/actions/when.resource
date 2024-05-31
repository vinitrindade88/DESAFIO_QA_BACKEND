*** Settings ***
Resource    ../../base.resource

*** Keywords ***
eu realizar uma transação interna no valor de ${amount}
    Post Dry Run Internal Transfers    ${amount}
    Set Test Variable    ${amountTransfer}  ${amount}