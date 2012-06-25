class AddThumbToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :thumb, :string
  end
end
