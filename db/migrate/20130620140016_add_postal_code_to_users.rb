class AddPostalCodeToUsers < ActiveRecord::Migration
  def change
    change_table :spree_users do |t|
      t.string :postal_code
    end
  end
end
