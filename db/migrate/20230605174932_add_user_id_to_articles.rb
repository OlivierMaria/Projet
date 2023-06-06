class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :integer
  
    # Mettre à jour les enregistrements existants pour avoir une valeur nulle pour user_id
    execute <<-SQL
      UPDATE articles
      SET user_id = NULL
    SQL
  
    change_column_null :articles, :user_id, true
  end
  
end
