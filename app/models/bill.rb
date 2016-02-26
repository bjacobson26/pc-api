class Bill < ActiveRecord::Base
  has_many :user_bills
  has_many :users, through: :user_bills
  acts_as_votable

  def to_param
    bill_identifier 
  end

  def self.find_or_create(bill_id)
    bill = Bill.where(bill_identifier: bill_id).first
    bill.nil? ? create_bill(bill_id) : already_exists(bill_id)
  end

  private

  def self.create_bill(id)
    puts "Creating new bill: #{id}"
    Bill.create!(bill_identifier: id)
  end

  def self.already_exists(id)
    puts "Bill: #{id} already exists in the DB"
  end

end
