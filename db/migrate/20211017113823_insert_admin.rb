class InsertAdmin < ActiveRecord::Migration[5.2]
  def up
    return if Rails.env == 'development'
    Admin.create!(
       email: 'aaa@aaa',
       password: 'aaaaaa',
    )
  end
end
