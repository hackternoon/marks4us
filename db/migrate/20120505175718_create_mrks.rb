class CreateMrks < ActiveRecord::Migration
  def change
    create_table :mrks do |t|
      t.string :uurl
      t.integer :usr_id
      t.integer :user_id
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.text :note

      t.timestamps
    end
  end
end
