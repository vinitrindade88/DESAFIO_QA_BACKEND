*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Get Balance
    [Arguments]
    ...  ${id}=${ACCOUNT_ID}

    ${response}  GET On Session
    ...  alias=${SANDBOX_API_ALIAS}
    ...  url=${BALANCE_ENDPOINT.format(accountId='${id}')}
    ...  expected_status=200

    Set Test Variable    ${response_get_balance}  ${response.json()}

Assert Get Balance

    Should Be Equal As Integers    ${response_get_balance['balance']}              ${balance.balance}
    Should Be Equal As Integers    ${response_get_balance['blocked_balance']}      ${balance.blocked_balance}
    Should Be Equal As Integers    ${response_get_balance['scheduled_balance']}    ${balance.scheduled_balance}