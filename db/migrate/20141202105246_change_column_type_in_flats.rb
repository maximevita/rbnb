class ChangeColumnTypeInFlats < ActiveRecord::Migration
  def change
    rename_column :flats, :type, :housing_type
  end
end
