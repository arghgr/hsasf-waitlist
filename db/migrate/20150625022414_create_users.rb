class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.integer :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
