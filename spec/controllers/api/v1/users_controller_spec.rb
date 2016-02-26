require 'rails_helper'

describe Api::V1::UsersController do
  let(:user) { User.create(email: "test@test.com", password: "testtest", password_confirmation: "testtest") }
  let(:bill) { Bill.create(bill_identifer: 'testbill1') }
  describe 'POST #upvote_bill' do
    post api_v1_upvote_bill_path payload
  end
end
