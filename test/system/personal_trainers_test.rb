require "application_system_test_case"

class PersonalTrainersTest < ApplicationSystemTestCase
  setup do
    @personal_trainer = personal_trainers(:one)
  end

  test "visiting the index" do
    visit personal_trainers_url
    assert_selector "h1", text: "Personal Trainers"
  end

  test "creating a Personal trainer" do
    visit personal_trainers_url
    click_on "New Personal Trainer"

    fill_in "Description", with: @personal_trainer.description
    fill_in "Email", with: @personal_trainer.email
    fill_in "Name", with: @personal_trainer.name
    fill_in "Noofclient", with: @personal_trainer.noOfClient
    fill_in "Number", with: @personal_trainer.number
    click_on "Create Personal trainer"

    assert_text "Personal trainer was successfully created"
    click_on "Back"
  end

  test "updating a Personal trainer" do
    visit personal_trainers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @personal_trainer.description
    fill_in "Email", with: @personal_trainer.email
    fill_in "Name", with: @personal_trainer.name
    fill_in "Noofclient", with: @personal_trainer.noOfClient
    fill_in "Number", with: @personal_trainer.number
    click_on "Update Personal trainer"

    assert_text "Personal trainer was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal trainer" do
    visit personal_trainers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal trainer was successfully destroyed"
  end
end
