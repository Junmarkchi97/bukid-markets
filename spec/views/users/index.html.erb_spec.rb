require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        username: "Username",
        first_name: "First Name",
        last_name: "Last Name",
        bio: "Bio",
        phone_number: "Phone Number",
        avatar: "Avatar",
        role: 2
      ),
      User.create!(
        username: "Username",
        first_name: "First Name",
        last_name: "Last Name",
        bio: "Bio",
        phone_number: "Phone Number",
        avatar: "Avatar",
        role: 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Bio".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Avatar".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
