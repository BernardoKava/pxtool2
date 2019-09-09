require 'test_helper'

class ItemPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_picture = item_pictures(:one)
  end

  test "should get index" do
    get item_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_item_picture_url
    assert_response :success
  end

  test "should create item_picture" do
    assert_difference('ItemPicture.count') do
      post item_pictures_url, params: { item_picture: { author: @item_picture.author, description: @item_picture.description, educational: @item_picture.educational, explicit: @item_picture.explicit, name: @item_picture.name, notes: @item_picture.notes, picture: @item_picture.picture, q: @item_picture.q, relevant: @item_picture.relevant, s: @item_picture.s } }
    end

    assert_redirected_to item_picture_url(ItemPicture.last)
  end

  test "should show item_picture" do
    get item_picture_url(@item_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_picture_url(@item_picture)
    assert_response :success
  end

  test "should update item_picture" do
    patch item_picture_url(@item_picture), params: { item_picture: { author: @item_picture.author, description: @item_picture.description, educational: @item_picture.educational, explicit: @item_picture.explicit, name: @item_picture.name, notes: @item_picture.notes, picture: @item_picture.picture, q: @item_picture.q, relevant: @item_picture.relevant, s: @item_picture.s } }
    assert_redirected_to item_picture_url(@item_picture)
  end

  test "should destroy item_picture" do
    assert_difference('ItemPicture.count', -1) do
      delete item_picture_url(@item_picture)
    end

    assert_redirected_to item_pictures_url
  end
end
