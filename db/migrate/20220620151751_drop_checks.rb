class DropChecks < ActiveRecord::Migration[6.0]
  def change
    drop_table :checks
  end
end
