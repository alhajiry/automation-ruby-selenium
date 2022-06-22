Feature: Test Sandbox

    @edit-company-info
    Scenario: Verify user edit company info and then logged out
        Given User login to "sandbox_sso_url" and navigate to "company_info" with account "test_account"
        Then Verify element contains "company_menu_page_content_subtitle" text will displayed
        When User click "edit_company_info_btn"
        Then Verify element contains "edit_company_page_title" text will displayed
        When User fill "company_name_field" with random word data
        And User fill "company_phone_field" with random phone data
        And User fill "company_email_field" with random email data
        And User fill "company_address_field" with random word data
        And User select dropdown menu "province_dropdown" with "DKI JAKARTA"
        And User select dropdown menu "city_dropdown" with "JAKARTA TIMUR"
        And User select dropdown menu "postal_code_dropdown" with "13140"
        And User select dropdown menu "industry_dropdown" with "Pertambangan"
        And User select dropdown menu "company_size_dropdown" with "51 sampai 100 karyawan"
        And User click "submit_btn"
        Then Verify element contains "edit_company_success_message" text will displayed
        When User click "account_header"
        And User click "logout_btn"
        Then "login_button" will be displayed

