class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.references :version, null: false, foreign_key: { to_table: :release_versions }
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :releases, %i[version_id product_id], unique: true
  end
end
