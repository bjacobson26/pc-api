class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_identifier
      t.timestamps null: false
    end
  end
end
