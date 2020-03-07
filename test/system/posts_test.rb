require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Address", with: @post.address
    fill_in "Constraint", with: @post.constraint
    fill_in "Contact email", with: @post.contact_email
    fill_in "Contact name", with: @post.contact_name
    fill_in "Contactno", with: @post.contactno
    fill_in "Description", with: @post.description
    fill_in "End time", with: @post.end_time
    fill_in "Fee", with: @post.fee
    fill_in "Service type", with: @post.service_type
    fill_in "Spot name", with: @post.spot_name
    fill_in "Start time", with: @post.start_time
    fill_in "User", with: @post.user_id
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Address", with: @post.address
    fill_in "Constraint", with: @post.constraint
    fill_in "Contact email", with: @post.contact_email
    fill_in "Contact name", with: @post.contact_name
    fill_in "Contactno", with: @post.contactno
    fill_in "Description", with: @post.description
    fill_in "End time", with: @post.end_time
    fill_in "Fee", with: @post.fee
    fill_in "Service type", with: @post.service_type
    fill_in "Spot name", with: @post.spot_name
    fill_in "Start time", with: @post.start_time
    fill_in "User", with: @post.user_id
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
