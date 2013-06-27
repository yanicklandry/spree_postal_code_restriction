class AddIsCanadian < ActiveRecord::Migration
  def change
    change_table :spree_users do |t|
      t.boolean :is_not_canadian
    end
  end
end
