require "application_system_test_case"

class ItemPicturesTest < ApplicationSystemTestCase
  setup do
    @item_picture = item_pictures(:one)
  end

  test "visiting the index" do
    visit item_pictures_url
    assert_selector "h1", text: "Item Pictures"
  end

  test "creating a Item picture" do
    visit item_pictures_url
    click_on "New Item Picture"

    fill_in "Author", with: @item_picture.author
    fill_in "Description", with: @item_picture.description
    check "Educational" if @item_picture.educational
    check "Explicit" if @item_picture.explicit
    fill_in "Name", with: @item_picture.name
    fill_in "Notes", with: @item_picture.notes
    fill_in "Picture", with: @item_picture.picture
    check "Q" if @item_picture.q
    check "Relevant" if @item_picture.relevant
    check "S" if @item_picture.s
    click_on "Create Item picture"

    assert_text "Item picture was successfully created"
    click_on "Back"
  end

  test "updating a Item picture" do
    visit item_pictures_url
    click_on "Edit", match: :first

    fill_in "Author", with: @item_picture.author
    fill_in "Description", with: @item_picture.description
    check "Educational" if @item_picture.educational
    check "Explicit" if @item_picture.explicit
    fill_in "Name", with: @item_picture.name
    fill_in "Notes", with: @item_picture.notes
    fill_in "Picture", with: @item_picture.picture
    check "Q" if @item_picture.q
    check "Relevant" if @item_picture.relevant
    check "S" if @item_picture.s
    click_on "Update Item picture"

    assert_text "Item picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Item picture" do
    visit item_pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item picture was successfully destroyed"
  end
end
