class ItemsPaid < ApplicationRecord
  belongs_to :merchandises
  belongs_to :orders_paids

  def transfer_data_table(orderspaidid)

    if orderspaidid 
      sql = <<-SQL
      INSERT INTO items_paids (merchandise_id, orders_paid_id)
      SELECT merchandise_id, order_id
      From order_items 
      WHERE order_id = #{orderspaidid} ;
      COMMIT;
      SQL

      ActiveRecord::Base.connection.execute(sql)

    else
      return 
    end
  end


end
