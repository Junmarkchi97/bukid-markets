require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      user: nil,
      street: "MyString",
      barangay: "MyString",
      city: "MyString",
      postal_code: "MyString",
      country: "MyString",
      phone_number: "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[user_id]"

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[barangay]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[postal_code]"

      assert_select "input[name=?]", "address[country]"

      assert_select "input[name=?]", "address[phone_number]"
    end
  end
end
