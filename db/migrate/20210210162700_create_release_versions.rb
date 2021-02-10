class CreateReleaseVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :release_versions do |t|
      t.string :version, null: false

      t.timestamps
    end
    add_index :release_versions, :version, unique: true
  end
end
