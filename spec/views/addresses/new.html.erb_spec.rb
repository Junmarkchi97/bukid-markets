require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      user: nil,
      street: "MyString",
      barangay: "MyString",
      city: "MyString",
      postal_code: "MyString",
      country: "MyString",
      phone_number: "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

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
