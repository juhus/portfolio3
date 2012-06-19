class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :type
      t.text :description
      t.text :content
      t.integer :website_id

      t.timestamps
    end
  end
end
