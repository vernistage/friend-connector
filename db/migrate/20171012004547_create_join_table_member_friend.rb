class CreateJoinTableMemberFriend < ActiveRecord::Migration[5.1]
  def change
    create_join_table :members, :friends do |t|
      t.index [:member_id, :friend_id]
      t.index [:friend_id, :member_id]

      t.timestamps
    end
  end
end
