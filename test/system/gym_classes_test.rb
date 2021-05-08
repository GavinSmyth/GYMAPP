require "application_system_test_case"

class GymClassesTest < ApplicationSystemTestCase
  setup do
    @gym_class = gym_classes(:one)
  end

  test "visiting the index" do
    visit gym_classes_url
    assert_selector "h1", text: "Gym Classes"
  end

  test "creating a Gym class" do
    visit gym_classes_url
    click_on "New Gym Class"

    fill_in "Class type", with: @gym_class.Class_type
    fill_in "Date", with: @gym_class.Date
    fill_in "Pt", with: @gym_class.PT_id
    fill_in "Pt name", with: @gym_class.PT_name
    fill_in "Time", with: @gym_class.Time
    click_on "Create Gym class"

    assert_text "Gym class was successfully created"
    click_on "Back"
  end

  test "updating a Gym class" do
    visit gym_classes_url
    click_on "Edit", match: :first

    fill_in "Class type", with: @gym_class.Class_type
    fill_in "Date", with: @gym_class.Date
    fill_in "Pt", with: @gym_class.PT_id
    fill_in "Pt name", with: @gym_class.PT_name
    fill_in "Time", with: @gym_class.Time
    click_on "Update Gym class"

    assert_text "Gym class was successfully updated"
    click_on "Back"
  end

  test "destroying a Gym class" do
    visit gym_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gym class was successfully destroyed"
  end
end
