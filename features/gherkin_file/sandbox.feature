@selenium-playground
Feature: Test Sandbox

    @test-01
    Scenario: Grab page title and place title text in answer slot #1
        Given User go to url "playground"
        When User save value from "page_title"
        Then User fill the "answer_box_title_page" form with saved value
    @test-02
    Scenario: Fill out name section of form to be Kilgore Trout
        Given User go to url "playground"
        Then User fill "name_form" with text "name"
    @test-03
    Scenario: Set occupation on form to Sci-Fi Author
        Given User go to url "playground"
        Then User select dropdown menu "occupation_dropdown" with "Science Fiction Author"
    @test-04
    Scenario: Set occupation on form to Sci-Fi Author
        Given User go to url "playground"
        When User count elements "bluebox"
        Then User fill the "answer_box_bluebox" form with saved value
    @test-05
    Scenario: Click link that says 'click me'
        Given User go to url "playground"
        Then User click element with "txt_button_click_me" text
    @test-06
    Scenario: Find red box on its page find class applied to it, and enter into answer box #6
        Given User go to url "playground"
        When User save element "redbox" "class" attribute
        Then User fill the "answer_box_redbox" form with saved value







