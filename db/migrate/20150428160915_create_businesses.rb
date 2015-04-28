class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    t.string :name
    t.text :description
    t.text :address
    t.string :typeofbusiness
    t.references :user_id
    t.timestamps null: false
	end 
  end
end
