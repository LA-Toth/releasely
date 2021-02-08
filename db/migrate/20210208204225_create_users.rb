class CreateUsers < ActiveRecord::Migration[6.1]
  class User < ActiveRecord::Base
    NOBODY = '-Nobody-'.freeze
  end

  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :given_name, null: false
      t.string :family_name, null: false, default: ''
      t.string :password_digest, null: false
      t.boolean :can_log_in, null: false, default: false

      t.timestamps
    end

    add_index :users, :username, unique: true

    reversible do |dir|
      dir.up do
        User.create(username: User::NOBODY, given_name: User::NOBODY, password_digest: User::NOBODY).save!
      end
    end
  end
end
