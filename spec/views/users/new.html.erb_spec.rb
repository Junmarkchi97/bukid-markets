require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      username: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      bio: "MyString",
      phone_number: "MyString",
      avatar: "MyString",
      role: 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[phone_number]"

      assert_select "input[name=?]", "user[avatar]"

      assert_select "input[name=?]", "user[role]"
    end
  end
end
