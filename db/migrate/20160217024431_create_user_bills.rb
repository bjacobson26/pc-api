class CreateUserBills < ActiveRecord::Migration
  def change
    create_table :user_bills do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bill, index: true
      t.timestamps null: false
    end
  end
end
