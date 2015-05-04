class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
