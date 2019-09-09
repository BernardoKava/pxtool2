require "application_system_test_case"

class ItemVideosTest < ApplicationSystemTestCase
  setup do
    @item_video = item_videos(:one)
  end

  test "visiting the index" do
    visit item_videos_url
    assert_selector "h1", text: "Item Videos"
  end

  test "creating a Item video" do
    visit item_videos_url
    click_on "New Item Video"

    fill_in "Author", with: @item_video.author
    fill_in "Description", with: @item_video.description
    check "Educational" if @item_video.educational
    check "Explicit" if @item_video.explicit
    fill_in "Name", with: @item_video.name
    fill_in "Notes", with: @item_video.notes
    fill_in "Picture", with: @item_video.picture
    check "Q" if @item_video.q
    check "Relevant" if @item_video.relevant
    check "S" if @item_video.s
    click_on "Create Item video"

    assert_text "Item video was successfully created"
    click_on "Back"
  end

  test "updating a Item video" do
    visit item_videos_url
    click_on "Edit", match: :first

    fill_in "Author", with: @item_video.author
    fill_in "Description", with: @item_video.description
    check "Educational" if @item_video.educational
    check "Explicit" if @item_video.explicit
    fill_in "Name", with: @item_video.name
    fill_in "Notes", with: @item_video.notes
    fill_in "Picture", with: @item_video.picture
    check "Q" if @item_video.q
    check "Relevant" if @item_video.relevant
    check "S" if @item_video.s
    click_on "Update Item video"

    assert_text "Item video was successfully updated"
    click_on "Back"
  end

  test "destroying a Item video" do
    visit item_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item video was successfully destroyed"
  end
end
