class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id, null: false
      t.boolean :up_vote, null: false
      t.references :votable, polymorphic: true, index: false

      t.timestamps(null: false)
    end
  end
end
