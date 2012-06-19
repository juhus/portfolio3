class RenameTypeToCodeTypefromCodes < ActiveRecord::Migration
  def change
    rename_column :codes, :type, :code_type
  end
end
