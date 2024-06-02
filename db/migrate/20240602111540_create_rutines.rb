class CreateRutines < ActiveRecord::Migration[7.1]
  def change
    create_table :rutines do |t|
      t.string :name
      t.integer :day
      t.integer :week
      t.string :nutrition, null: false, default: "Musculo"
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :trainer_id, null: false

      t.timestamps
    end
  end
end
