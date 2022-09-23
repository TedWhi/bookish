class AddCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.string :Borrower
      t.date :DueDate
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end