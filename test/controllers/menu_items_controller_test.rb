require "test_helper"

describe MenuItemsController do
  it "should get index" do
    get menu_items_index_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get menu_items_edit_url
    value(response).must_be :success?
  end

  it "should get new" do
    get menu_items_new_url
    value(response).must_be :success?
  end

end
