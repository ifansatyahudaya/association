class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :religion
      t.boolean :gender
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
