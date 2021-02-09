class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.references :shared_by, null: false, foreign_key: {to_table: :users}
      t.references :shared_with, null: false, foreign_key: {to_table: :users}
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
