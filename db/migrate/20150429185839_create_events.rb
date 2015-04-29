class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, index: true
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :business_id, index: true
      t.integer :user_id,  index: true
      t.timestamps null: false
    end
  end
end
