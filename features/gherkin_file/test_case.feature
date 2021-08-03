Feature: Test Mekari

    #Select dropdown existing product on the list
    Scenario: User select dropdown existing customer on the list and select transaction date by inputting date
        Given User login and navigate to "navigation_sales"
        When User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
        And User select dropdown input "jurnal_select_customer_field" with data "dropdown_customer_john_doe"
        And User fill "date_picker_transaction_date" with text "first_day_of_september"
        Then "date_picker_transaction_date" value will be equal to "first_day_of_september"
        When User fill "date_picker_due_date" with text "last_day_of_september"
        Then "date_picker_due_date" value will be equal to "last_day_of_september"
        # Select existing product
        And User select dropdown input "jurnal_select_product_field" with data "dropdown_product_sales"
        And "jurnal_input_product_first" value will be equal to "dropdown_product_sales"


    # Add new product
    Scenario: User select dropdown customer with add new customer and select transaction by selection date modal
        Given User login and navigate to "navigation_sales"
        When User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
        And User click "jurnal_select_customer_field"
        # #Add New Customer Data
        And User click "jurnal_add_new_customer_text_button"
        Then "create_contact_modal" will be displayed
        When User fill "jurnal_add_new_customer_name_field" with random word data
        And User fill "jurnal_add_new_customer_email_field" with random email data
        And User fill "jurnal_add_new_customer_telephone_field" with random phone data
        And User fill "jurnal_add_new_customer_billing_address_field" with text "billing_address_data"
        And User click "billing_address_checkbox"
        And User click "jurnal_save_button"
        Then "create_contact_modal" will not displayed
        When User wait 2 seconds
        #pick a date from date picker modal
        And User pick a date "first_day_of_september" in "date_picker_transaction_date" calendar
        Then "date_picker_transaction_date" value will be equal to "first_day_of_september"
        When User pick a date "last_day_of_september" in "date_picker_due_date" calendar
        Then "date_picker_due_date" value will be equal to "last_day_of_september"
        #Add New Product
        When User click "jurnal_select_product_field"
        And User click "jurnal_add_new_product_text_button"
        Then "add_new_product_modal" will be displayed
        When User fill "jurnal_add_new_product_name" with random word data
        And User select dropdown input "jurnal_add_new_product_unit" with data "dropdown_product_unit_pcs"
        And User fill "jurnal_add_new_product_code" with random SKU data
        And User click "jurnal_buy_item_checkbox"
        And User fill "jurnal_add_new_buy_unit_price" with text "dropdown_product_buy_amount"
        And User select dropdown input "jurnal_add_new_buy_account" with data "dropdown_product_buy_account_cash"
        And User select dropdown input "jurnal_add_new_buy_tax" with data "dropdown_product_buy_tax_ppn"
        And User click "jurnal_save_button"
        Then "add_new_product_modal" will not displayed
        #Add New Product with other buy account
        When User click "jurnal_select_product_field"
        And User click "jurnal_add_new_product_text_button"
        Then "add_new_product_modal" will be displayed
        When User fill "jurnal_add_new_product_name" with random word data
        And User select dropdown input "jurnal_add_new_product_unit" with data "dropdown_product_unit_pcs"
        And User fill "jurnal_add_new_product_code" with random SKU data
        And User click "jurnal_buy_item_checkbox"
        And User fill "jurnal_add_new_buy_unit_price" with text "dropdown_product_buy_amount"
        And User select dropdown input "jurnal_add_new_buy_account" with data "dropdown_product_buy_account_vat_in"
        And User select dropdown input "jurnal_add_new_buy_tax" with data "dropdown_product_buy_tax_ppn"
        And User click "jurnal_save_button"
        Then "add_new_product_modal" will not displayed
        #Fill Image
        And User fill "jurnal_upload_image" with image "sample-image.jpeg"
        And User wait 10 seconds












# Scenario:

#     And User select dropdown input "jurnal_select_customer_field" with data "dropdown_customer_john_doe"
#     #select date
#     And User fill "date_picker_transaction_date" with "first_day_of_september"
#     # And User fill "date_picker_due_date" with "last_day_of_september"
#     And User pick a date "first_day_of_september" in "date_picker_transaction_date" calendar

#     # Scenario: User add new customer
#     #     Given User go to url "mekari_jurnal_url"
#     #     When User login to mekari journal with "test_account"
#     #     And User check and click "notification_modal_close_button" if exist
#     #     And User click "navigation_sales"
#     #     And User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
#     #     #Add New Customer Data
#     And User click "jurnal_select_customer_field"
#     And User click "jurnal_add_new_customer_text_button"
#     And User fill "jurnal_add_new_customer_name_field" with random word data
#     And User fill "jurnal_add_new_customer_email_field" with random email data
#     And User fill "jurnal_add_new_customer_telephone_field" with random phone data
#     And User fill "jurnal_add_new_customer_billing_address_field" with "billing_address_data"

#     And User click "billing_address_checkbox"
#     And User click "jurnal_save_button"
