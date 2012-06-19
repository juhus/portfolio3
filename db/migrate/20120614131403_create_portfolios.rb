class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :permalink
      t.string :title
      t.text :content
      t.boolean :publish
      t.integer :website_id

      t.timestamps
    end
    add_index :portfolios, :website_id
  end
end