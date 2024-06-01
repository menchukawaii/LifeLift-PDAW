class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :is_admin
      t.boolean :is_trainer

      t.timestamps
    end
  end
end