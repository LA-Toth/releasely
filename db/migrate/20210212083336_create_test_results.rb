class CreateTestResults < ActiveRecord::Migration[6.1]
  class User < ActiveRecord::Base
    NOBODY = '-Nobody-'.freeze

    def self.unknown_user
      find_by(username: NOBODY)
    end
  end

  def change
    create_table :test_results do |t|
      t.integer :ext_id, null: false, uniq: true
      t.integer :tests_count, null: false
      t.integer :tests_passed, null: false
      t.integer :tests_failed, null: false
      t.integer :tests_skipped, null: false
      t.references :release, null: false, foreign_key: true
      t.references :split, null: false, foreign_key: { to_table: :test_splits }
      t.references :config, null: false, foreign_key: { to_table: :test_configs }
      t.references :asssignee, null: false, foreign_key: { to_table: :users }, default: User.unknown_user.id

      t.timestamps
    end
  end
end
