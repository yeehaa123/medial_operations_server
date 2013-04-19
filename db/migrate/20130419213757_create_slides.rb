class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.string :image_url
      t.integer :order

      t.timestamps
    end
  end
end
