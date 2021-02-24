class CreateLicences < ActiveRecord::Migration[6.0]
  def change
    create_table :licences do |t|
      t.string :key
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
