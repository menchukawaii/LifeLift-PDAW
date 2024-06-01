class CreateInscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :inscriptions do |t|
      t.string :goal
      t.text :comment
      t.integer :age
      t.float :height
      t.float :weight
      t.float :weight_goal
      t.float :body_fat
      t.float :body_fat_goal
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
