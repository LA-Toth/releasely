class CreateTestConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :test_configs do |t|
      t.string :name, null: false
      t.string :short_name, null: false

      t.timestamps
    end
    add_index :test_configs, :name, unique: true
  end
end
