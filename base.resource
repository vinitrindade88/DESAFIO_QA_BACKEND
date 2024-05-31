*** Settings ***
## Bibliotecas
Library    RequestsLibrary
Library    JSONLibrary

## Custom Libraries
Library  resource/libs/loadDotEnv.py

## Endpoints
Resource    resource/service/balanceRequest.resource
Resource    resource/service/accountsRequest.resource
Resource    resource/service/statementsRequest.resource
Resource    resource/service/internalTransferRequest.resource

## Constants
Variables    resource/constants/balance.yaml
Variables    resource/constants/statements.yaml
Variables    resource/constants/internalTransfers.yaml

## Prefixos Gherkin
Resource    resource/actions/given.resource
Resource    resource/actions/when.resource
Resource    resource/actions/then.resource

## Utils
Library      resource/utils/utils.py

*** Variables ***
${SANDBOX_API_URL}         %{SANDBOX_OPENBANK_URL=${EMPTY}}
${SANDBOX_API_ALIAS}       sandbox
${ACCOUNTS_ENDPOINT}       %{ACCOUNTS_ENDPOINT=${EMPTY}}
${STATEMENTS_ENDPOINT}     %{STATEMENTS_ENDPOINT=${EMPTY}}
${BALANCE_ENDPOINT}        %{BALANCE_ENDPOINT=${EMPTY}}
${INTERNAL_TRANSFERS_ENDPOINT}        %{INTERNAL_TRANSFERS_ENDPOINT=${EMPTY}}

${TARGET_ACCOUNT}          %{TARGET_ACCOUNT=${EMPTY}}


*** Keywords ***
Create Session To Sandbox API

    ${token}  Get Stone Auth Token

    ${header}  Create Dictionary  Authorization=${token}

    Create Session    
    ...    alias=${SANDBOX_API_ALIAS}    
    ...    url=${SANDBOX_API_URL}
    ...    headers=${header}
    ...    verify=${False}
    ...    disable_warnings=${True}