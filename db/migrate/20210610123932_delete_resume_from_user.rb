class DeleteResumeFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :resume, :text
  end
end
