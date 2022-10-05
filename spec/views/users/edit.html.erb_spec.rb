require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      username: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      bio: "MyString",
      phone_number: "MyString",
      avatar: "MyString",
      role: 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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
