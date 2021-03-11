require "application_system_test_case"

class EverychecksTest < ApplicationSystemTestCase
  setup do
    @everycheck = everychecks(:one)
  end

  test "visiting the index" do
    visit everychecks_url
    assert_selector "h1", text: "Everychecks"
  end

  test "creating a Everycheck" do
    visit everychecks_url
    click_on "New Everycheck"

    fill_in "Calorie", with: @everycheck.calorie
    fill_in "Eat date", with: @everycheck.eat_date
    fill_in "Eat time", with: @everycheck.eat_time
    fill_in "Foodname", with: @everycheck.foodname
    click_on "Create Everycheck"

    assert_text "Everycheck was successfully created"
    click_on "Back"
  end

  test "updating a Everycheck" do
    visit everychecks_url
    click_on "Edit", match: :first

    fill_in "Calorie", with: @everycheck.calorie
    fill_in "Eat date", with: @everycheck.eat_date
    fill_in "Eat time", with: @everycheck.eat_time
    fill_in "Foodname", with: @everycheck.foodname
    click_on "Update Everycheck"

    assert_text "Everycheck was successfully updated"
    click_on "Back"
  end

  test "destroying a Everycheck" do
    visit everychecks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Everycheck was successfully destroyed"
  end
end
