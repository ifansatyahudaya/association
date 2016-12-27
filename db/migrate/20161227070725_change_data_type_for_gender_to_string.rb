class ChangeDataTypeForGenderToString < ActiveRecord::Migration[5.0]
  def up
    change_column :profiles, :gender, :string
  end

  def down
    change_column :profiles, :gender, :boolean
  end
end
