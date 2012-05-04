class CreateUsrs < ActiveRecord::Migration
  def change
    create_table :usrs do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
