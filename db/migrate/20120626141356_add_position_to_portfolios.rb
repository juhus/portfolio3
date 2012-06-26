class AddPositionToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :position, :integer
  end
end
