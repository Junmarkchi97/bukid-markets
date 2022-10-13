require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        user: nil,
        street: "Street",
        barangay: "Barangay",
        city: "City",
        postal_code: "Postal Code",
        country: "Country",
        phone_number: "Phone Number"
      ),
      Address.create!(
        user: nil,
        street: "Street",
        barangay: "Barangay",
        city: "City",
        postal_code: "Postal Code",
        country: "Country",
        phone_number: "Phone Number"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Street".to_s, count: 2
    assert_select "tr>td", text: "Barangay".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Postal Code".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
  end
end
