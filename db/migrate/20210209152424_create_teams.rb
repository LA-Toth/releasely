class CreateTeams < ActiveRecord::Migration[6.1]
  class User < ActiveRecord::Base
    NOBODY = '-Nobody-'.freeze

    def self.unknown_user
      find_by(username: NOBODY)
    end
  end

  class Team < ActiveRecord::Base
    NO_TEAM = '-NO-TEAM-'.freeze
    belongs_to :lead, class_name: 'User'
  end

  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :lead, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :teams, :name, unique: true

    reversible do |dir|
      dir.up do
        team = Team.create(name: Team::NO_TEAM, lead: User.unknown_user)
        team.save!
        add_column :users, :team_id, :integer, default: team.id, null: false
        add_foreign_key :users, :teams, null: false
      end

      dir.down do
        remove_column :users, :team_id
      end
    end
  end
end
