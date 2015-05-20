class CreateGreenpoints < ActiveRecord::Migration
  def change
    create_table :greenpoints do |t|
      t.integer "business_id"
      t.integer "electricity"
      t.integer "transportation"
      t.integer "recycling"
      t.integer "total"
      t.timestamps null: false
    end
  end
end
