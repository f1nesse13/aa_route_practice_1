class RenameToyColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :toys, :type, :ttype
  end
end
