class CreateRutineSets < ActiveRecord::Migration[7.1]
  def change
    create_table :rutine_sets do |t|
      t.belongs_to :exercise, null: false, foreign_key: true
      t.belongs_to :rutine, null: false, foreign_key: true
      t.integer :reps
      t.integer :weight
      t.boolean :is_done, default: false

      t.timestamps
    end
  end
end
