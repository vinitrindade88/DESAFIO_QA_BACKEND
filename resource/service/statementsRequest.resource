*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Get Statements
    [Arguments]
    ...  ${id}=${ACCOUNT_ID}

    ${response}  GET On Session
    ...  alias=${SANDBOX_API_ALIAS}
    ...  url=${STATEMENTS_ENDPOINT.format(accountId='${id}')}
    ...  expected_status=200

    Set Test Variable    ${response_get_statements}  ${response.json()}

Assert Get Statements

    Should Be Equal As Integers    ${response_get_statements['data'][0]['amount']}    350000