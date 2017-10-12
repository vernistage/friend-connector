class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      # references = similar to belongs_to
      # creates user_id foreign key column
      t.references :member, index: true, foreign_key: true
      # defines friend role
      t.references :friend, index: true

      t.timestamps null: false
    end

    # Defines friend_id as foreign key in friendships for members
    add_foreign_key :friendships, :members, column: :friend_id
    # Makes searching faster & pairing must be unique
    add_index :friendships, [:member_id, :friend_id], unique: true
  end
end
