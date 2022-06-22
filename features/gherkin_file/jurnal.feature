Feature: Test Mekari
    # This scenario also cover
    # Add New Customer
    # Select date using date selection modal
    # Add New Product
    # Add New Product using new buy account
    # Input Price
    # Upload Image
    Scenario: User create new invoice and random data
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
        And User select dropdown input "jurnal_add_new_buy_tax" with data "dropdown_product_buy_tax_ppn"
        And User click "jurnal_save_button"
        Then "add_new_product_modal" will not displayed
        #Add New Product with other buy account
        When User click "jurnal_select_product_2_field"
        And User click "jurnal_add_new_product_2_text_button"
        Then "add_new_product_2_modal" will be displayed
        When User fill "jurnal_add_new_product_name" with random word data
        And User select dropdown input "jurnal_add_new_product_unit" with data "dropdown_product_unit_pcs"
        And User fill "jurnal_add_new_product_code" with random SKU data
        And User click "jurnal_buy_item_checkbox"
        And User fill "jurnal_add_new_buy_unit_price" with text "dropdown_product_buy_amount"
        And User select dropdown input "jurnal_add_new_buy_account" with data "dropdown_product_buy_account_vat_in"
        And User select dropdown input "jurnal_add_new_buy_tax" with data "dropdown_product_buy_tax_ppn"
        And User click "jurnal_save_button"
        Then "add_new_product_2_modal" will not displayed
        #Input Price
        When User click "jurnal_product_input_price"
        And User fill "jurnal_product_input_price" with text "product_input_price_10k"
        #click by coordinate is needed as if not performed, the price input reset to zero
        And User click by coordinate 0#0
        #input Price for product 2
        And User click "jurnal_product_2_input_price"
        And User fill "jurnal_product_2_input_price" with text "product_input_price_20k"
        And User click by coordinate 0#0
        #Fill Image
        And User fill "jurnal_upload_image" with image "sample-image.jpeg"
        And User click "create_invoice_button"
        Then "sales_invoice_container" will be displayed

    #Select existing customer
    #Input date with input field
    #Select existing product
    #Verify invoice with fixed data
    Scenario: Verify invoice data with fixed data
        Given User login and navigate to "navigation_sales"
        When User select dropdown button "create_new_sales_dropdown_button" with data "dropdown_sales_invoice"
        And User click "jurnal_select_customer_field"
        # Select existing data
        And User select dropdown input "jurnal_select_customer_field" with data "checker_username"
        # Input date with SendKeys
        And User fill "date_picker_transaction_date" with text "first_day_of_september"
        Then "date_picker_transaction_date" value will be equal to "first_day_of_september"
        When User fill "date_picker_due_date" with text "last_day_of_september"
        # Input date with date picker
        Then "date_picker_due_date" value will be equal to "last_day_of_september"
        And User pick a date "first_day_of_september" in "date_picker_transaction_date" calendar
        Then "date_picker_transaction_date" value will be equal to "first_day_of_september"
        When User pick a date "last_day_of_september" in "date_picker_due_date" calendar
        Then "date_picker_due_date" value will be equal to "last_day_of_september"

        #Select Existing Product
        And User select dropdown input "jurnal_select_product_field" with data "checker_product_name"
        #Input Price
        When User click "jurnal_product_input_price"
        And User fill "jurnal_product_input_price" with text "checker_buy_unit_price"
        #click by coordinate is needed as if not performed, the price input reset to zero
        And User click by coordinate 0#0
        #Fill Image
        And User fill "jurnal_upload_image" with image "sample-image.jpeg"
        And User click "create_invoice_button"
        Then "sales_invoice_container" will be displayed
        #Verify data
        And User wait 5 seconds
        Then Verify "sales_invoice_customer_name" text will be equal to "checker_username"
        Then Verify "sales_invoice_billing_address" text will be equal to "checker_billing_address"
        Then Verify "sales_invoice_product_email" text will be equal to "checker_email"

        Then Verify "sales_invoice_product_1" text will be equal to "checker_product_name"
        Then Verify "sales_invoice_product_1_quantity" text will be equal to "checker_buy_unit_quantity"
        Then Verify "sales_invoice_product_1_unit" text will be equal to "dropdown_product_unit_pcs"
        Then Verify "sales_invoice_product_1_discount" text will be equal to "checker_buy_unit_discount"
        Then Verify "sales_invoice_product_1_tax" text will be equal to "checker_tax"
        Then Verify "sales_invoice_product_1_amount" text will be equal to "checker_buy_unit_amount"
        Then Verify "sales_invoice_product_1_subtotal" text will be equal to "checker_buy_unit_amount"
        Then Verify "sales_invoice_product_1_total" text will be equal to "checker_buy_unit_amount"
        Then Verify "sales_invoice_product_1_balance_due" text will be equal to "checker_buy_unit_amount"
        Then Verify "sales_invoice_product_attachment" text will be equal to "checker_image"
        Then Verify "sales_invoice_transaction_date" text will be equal to "first_day_of_september"
        Then Verify "sales_invoice_due_date" text will be equal to "last_day_of_september"





























