class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :book_title
      t.date :publishing_date
      t.string :author
      t.decimal :desired_price
      t.string :language_of_edition

      t.timestamps
    end
  end
end
