*** Settings ***
Resource    ../../base.resource
Library    DateTime

*** Keywords ***
Post Dry Run Internal Transfers
    [Arguments]
    ...  ${amount}
    ...  ${id}=${ACCOUNT_ID}
    ...  ${targetAccountCode}=${TARGET_ACCOUNT}

    ${json}  Load Json From File    ${CURDIR}${/}json${/}internalTransfers.json

    ${json}  Update Value To Json    ${json}    $.amount                        ${${amount}}
    ${json}  Update Value To Json    ${json}    $.account_id                    ${id}
    ${json}  Update Value To Json    ${json}    $.target.account.account_code   ${targetAccountCode}

    ${response}  Post On Session
    ...  alias=${SANDBOX_API_ALIAS}
    ...  url=${INTERNAL_TRANSFERS_ENDPOINT}
    ...  json=${json}
    ...  expected_status=201

    Set Test Variable    ${response_internal_transfers}    ${response.json()}


Assert Post Dry Run Internal Transfers
    
    ${createdAt}  Get Current Date  result_format=%Y-%m-%d


    Should Be Equal As Strings    ${response_internal_transfers["account_id"]}                         ${ACCOUNT_ID}
    Should Be Equal As Strings    ${response_internal_transfers["additional_data"]}                    ${internalTransfers.additionalData}
    Should Be Equal As Strings    ${response_internal_transfers["amount"]}                             ${amountTransfer}
    Should Be Equal As Strings    ${response_internal_transfers["approval_expired_at"]}                ${internalTransfers.approvalExpiredAt}
    Should Be Equal As Strings    ${response_internal_transfers["approved_at"]}                        ${internalTransfers.approvedAt}
    Should Be Equal As Strings    ${response_internal_transfers["approved_by"]}                        ${internalTransfers.approvedBy}
    Should Be Equal As Strings    ${response_internal_transfers["batch_id"]}                           ${internalTransfers.batchId}
    Should Be Equal As Strings    ${response_internal_transfers["cancelled_at"]}                       ${internalTransfers.cancelledAt}
    Should Be Equal As Strings    ${response_internal_transfers["cancelled_by"]}                       ${internalTransfers.cancelledBy}
    Should Contain                ${response_internal_transfers["created_at"]}                         ${createdAt}
    Should Be Equal As Strings    ${response_internal_transfers["created_by"]}                         ${internalTransfers.createdBy}
    Should Be Equal As Strings    ${response_internal_transfers["description"]}                        ${internalTransfers.description}
    Should Be Equal As Strings    ${response_internal_transfers["failed_at"]}                          ${internalTransfers.failedAt}
    Should Be Equal As Strings    ${response_internal_transfers["failure_reason_code"]}                ${internalTransfers.failureReasonCode}
    Should Be Equal As Strings    ${response_internal_transfers["failure_reason_description"]}         ${internalTransfers.failureReasonDescription}
    Should Be Equal As Strings    ${response_internal_transfers["fee"]}                                ${internalTransfers.fee}
    Should Be Equal As Strings    ${response_internal_transfers["finished_at"]}                        ${internalTransfers.finishedAt}
    Should Be Equal As Strings    ${response_internal_transfers["has_similar_operation_recently"]}     ${internalTransfers.hasSimilarOperationRecently}
    Should Not Be Empty           ${response_internal_transfers["id"]}
    Should Be Equal As Strings    ${response_internal_transfers["rejected_at"]}                        ${internalTransfers.rejectedAt}
    Should Be Equal As Strings    ${response_internal_transfers["rejected_by"]}                        ${internalTransfers.rejectedBy}
    Should Be Equal As Strings    ${response_internal_transfers["scheduled_to"]}                       ${internalTransfers.scheduledTo}
    Should Be Equal As Strings    ${response_internal_transfers["settled_at"]}                         ${internalTransfers.settledAt}
    Should Be Equal As Strings    ${response_internal_transfers["status"]}                             ${internalTransfers.status}
    Should Be Equal As Strings    ${response_internal_transfers["target"]["account"]["account_code"]}  ${TARGET_ACCOUNT}
    Should Be Equal As Strings    ${response_internal_transfers["target"]["entity"]["name"]}           ${internalTransfers.targetEntityName}
    Should Be Equal As Strings    ${response_internal_transfers["target_account_code"]}                ${TARGET_ACCOUNT}
    Should Be Equal As Strings    ${response_internal_transfers["target_account_owner_name"]}          ${internalTransfers.targetAccountOwnerName}
    Should Be Equal As Strings    ${response_internal_transfers["target_in_contacts"]}                 ${internalTransfers.targetInContacts}
