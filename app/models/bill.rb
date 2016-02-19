class Bill < ActiveRecord::Base
  has_many :user_bills
  has_many :users, through: :user_bills
  acts_as_votable

  def to_param
    bill_identifier 
  end
end
