class RenamePortfolioItemsToPortfolios < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :portfolio_items, :portfolios
  end

  def self.down
    rename_table :portfolios, :portfolio_items
  end
end
