require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      username: "Username",
      first_name: "First Name",
      last_name: "Last Name",
      bio: "Bio",
      phone_number: "Phone Number",
      avatar: "Avatar",
      role: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/2/)
  end
end
