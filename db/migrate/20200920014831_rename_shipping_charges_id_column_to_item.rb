class RenameShippingChargesIdColumnToItem < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_charges_id, :shipping_charge_id
  end
end
