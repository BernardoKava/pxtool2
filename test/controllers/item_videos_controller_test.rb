require 'test_helper'

class ItemVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_video = item_videos(:one)
  end

  test "should get index" do
    get item_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_item_video_url
    assert_response :success
  end

  test "should create item_video" do
    assert_difference('ItemVideo.count') do
      post item_videos_url, params: { item_video: { author: @item_video.author, description: @item_video.description, educational: @item_video.educational, explicit: @item_video.explicit, name: @item_video.name, notes: @item_video.notes, picture: @item_video.picture, q: @item_video.q, relevant: @item_video.relevant, s: @item_video.s } }
    end

    assert_redirected_to item_video_url(ItemVideo.last)
  end

  test "should show item_video" do
    get item_video_url(@item_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_video_url(@item_video)
    assert_response :success
  end

  test "should update item_video" do
    patch item_video_url(@item_video), params: { item_video: { author: @item_video.author, description: @item_video.description, educational: @item_video.educational, explicit: @item_video.explicit, name: @item_video.name, notes: @item_video.notes, picture: @item_video.picture, q: @item_video.q, relevant: @item_video.relevant, s: @item_video.s } }
    assert_redirected_to item_video_url(@item_video)
  end

  test "should destroy item_video" do
    assert_difference('ItemVideo.count', -1) do
      delete item_video_url(@item_video)
    end

    assert_redirected_to item_videos_url
  end
end
