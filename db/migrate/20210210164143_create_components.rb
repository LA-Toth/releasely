class CreateComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :components do |t|
      t.string :name, null: false
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
    add_index :components, :name, unique: true
  end
end
