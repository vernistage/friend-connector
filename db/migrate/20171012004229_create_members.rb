class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name,          null: false
      t.string :website,       null: false
      t.string :short_url,     null: false, default: ""
      t.text :scraped_content, null: false, default: ""

      t.timestamps null: false
    end
  end
end
