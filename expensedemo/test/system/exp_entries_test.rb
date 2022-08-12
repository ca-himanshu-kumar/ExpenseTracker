require "application_system_test_case"

class ExpEntriesTest < ApplicationSystemTestCase
  setup do
    @exp_entry = exp_entries(:one)
  end

  test "visiting the index" do
    visit exp_entries_url
    assert_selector "h1", text: "Exp Entries"
  end

  test "creating a Exp entry" do
    visit exp_entries_url
    click_on "New Exp Entry"

    fill_in "Billdate", with: @exp_entry.BillDate
    fill_in "Amount", with: @exp_entry.amount
    fill_in "Billno", with: @exp_entry.billNo
    fill_in "Group", with: @exp_entry.group
    fill_in "Title", with: @exp_entry.title
    fill_in "User", with: @exp_entry.user_id
    click_on "Create Exp entry"

    assert_text "Exp entry was successfully created"
    click_on "Back"
  end

  test "updating a Exp entry" do
    visit exp_entries_url
    click_on "Edit", match: :first

    fill_in "Billdate", with: @exp_entry.BillDate
    fill_in "Amount", with: @exp_entry.amount
    fill_in "Billno", with: @exp_entry.billNo
    fill_in "Group", with: @exp_entry.group
    fill_in "Title", with: @exp_entry.title
    fill_in "User", with: @exp_entry.user_id
    click_on "Update Exp entry"

    assert_text "Exp entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Exp entry" do
    visit exp_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exp entry was successfully destroyed"
  end
end
