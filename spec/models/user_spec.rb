require 'rails_helper'

RSpec.describe User, type: :model do
  # current_user = User.first_or_create!(email:"junmarkchi97@gmail.com", password: "<%= User.new.send(:password_digest, '123456') %>", password_confirmation: "<%= User.new.send(:password_digest, '123456') %>")

  it 'returns the full_name for a user' do
    user = create(:user, first_name: "Junmark", last_name: "Chi")

    expect(user.full_name).to eq 'Junmark Chi'
  end

  it 'reject users without a username' do
    user = User.create!(email:"junmarkchi197@gmail.com", password:"123456", username: "", first_name: "Junmark", last_name: "Chi", confirmed_at: "2022-10-03 16:09:22.428985000 +0000")

    expect(user).to_not be_valid

  end

  # it 'should reject users without a first name' do
  #   user = User.create(first_name: "Junmark", last_name: "Chi")

  #   expect(user.full_name).to eq 'Junmark Chi'
  # end

  # it 'should reject users without a last name' do
  #   user = User.create(first_name: "Junmark", last_name: "Chi")

  #   expect(user.full_name).to eq 'Junmark Chi'
  # end
end
