class AddApprovalToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :approval, :integer
  end
end
