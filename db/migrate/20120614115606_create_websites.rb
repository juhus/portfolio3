class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :title
      t.string :domain
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
