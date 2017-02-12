class CreatePortfolioItems < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_items do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :image
      t.text :thumbnail

      t.timestamps
    end
  end
end
