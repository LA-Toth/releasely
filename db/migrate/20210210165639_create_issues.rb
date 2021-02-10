class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :issue_key, null: false
      t.string :title, null: false
      t.string :state, null: false
      t.boolean :blocker, null: false, default: false
      t.datetime :last_updated_at, null: false
      t.datetime :last_reply_at, null: false
      t.references :assignee, null: false, foreign_key: { to_table: :users }
      t.integer :issue_category, null: false, default: 0

      t.timestamps
    end
    add_index :issues, :issue_key, unique: true
    add_index :issues, :issue_category
    add_index :issues, :blocker
  end
end
