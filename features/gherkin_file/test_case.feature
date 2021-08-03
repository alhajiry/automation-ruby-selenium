Feature: Test Mekari

    Scenario: User select existing customer
        Given User go to url "mekari_jurnal_url"
        When User login to mekari journal with "test_account"
        And User check and click "notification_modal_close_button" if exist
        And User click "navigation_sales"
        And User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
        And User select dropdown input "jurnal_select_customer_field" with data "dropdown_customer_john_doe"


    Scenario: User add new customer
        Given User go to url "mekari_jurnal_url"
        When User login to mekari journal with "test_account"
        And User check and click "notification_modal_close_button" if exist
        And User click "navigation_sales"
        And User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
        #Add New Customer Data
        And User click "jurnal_select_customer_field"
        And User click "jurnal_add_new_customer_text_button"
        And User fill "jurnal_add_new_customer_name_field" with random word data
        And User fill "jurnal_add_new_customer_email_field" with random email data
        And User fill "jurnal_add_new_customer_telephone_field" with random phone data
        And User fill "jurnal_add_new_customer_billing_address_field" with "billing_address_data"

        And User click "billing_address_checkbox"
        And User click "jurnal_save_button"
