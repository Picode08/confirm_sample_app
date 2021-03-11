class AddUserIdToEverycheck < ActiveRecord::Migration[5.2]
  def change
    add_reference :everychecks, :user, foreign_key: true
  end
end
