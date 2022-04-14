class AddTokenToTwitterAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :twitter_accounts, :token, :string
  end
end
