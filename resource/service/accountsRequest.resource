*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Get Account

    ${response}  GET On Session
    ...  alias=${SANDBOX_API_ALIAS}
    ...  url=${ACCOUNTS_ENDPOINT}
    ...  expected_status=200

    Set Test Variable  ${ACCOUNT_ID}  ${response.json()[0]['id']}