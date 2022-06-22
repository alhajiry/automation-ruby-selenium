Feature: Test Sandbox

    Scenario: Verify user edit company info and then logged out
        Given User login to "sandbox_sso_url" and navigate to "company_info" with account "test_account"
        When User click "edit_company_info_btn"
        And User select dropdown menu "province_dropdown" with "bali"