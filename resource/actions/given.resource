*** Settings ***
Resource    ../../base.resource

*** Keywords ***
que eu esteja autenticado
    Create Session To Sandbox API
    Get Account