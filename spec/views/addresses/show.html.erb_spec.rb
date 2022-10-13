require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      user: nil,
      street: "Street",
      barangay: "Barangay",
      city: "City",
      postal_code: "Postal Code",
      country: "Country",
      phone_number: "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Barangay/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone Number/)
  end
end
