class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string                :phone_number, null: false
      t.string                :postal_code, null: false
      t.integer               :prefecture_id, null: false
      t.string                :city, null: false
      t.string                :house_name, null: false
      t.string                :building_name
      t.references            :buy_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
