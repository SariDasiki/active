class ExercisesController < ApplicationController
  def exercise1
    # 注文されていないすべての料理
    #   * left_outer_joinsを使うこと
    @foods = Food.left_outer_joins(:order_foods)
    .where(order_foods: { id: nil })
  end

  def exercise2
    # 【要件】注文されていない料理を提供してる店 
      # * left_outer_joinsを使うこと
      # 1: shop 多 :foods
      # 1: foods 多: order_foods 
      # 考え方1️⃣ shopからfoods見てる
      # 考え方2️⃣ shopからorder_foods見てる
      # shopから見たfoods [foods:]
      # shopから見たorder_foods[:order_foods]
    @shops = Shop.left_outer_joins(foods: :order_foods)
    .distinct
    .where(foods: {order_foods: { id: nil }} )
  end

  def exercise3 
    # 【要件】配達先の一番多い住所を返すこと maxとcount
    #   * 取得したAddressのインスタンスにorders_countと
    # 呼びかけると注文の数を返すこと
    # @address = Address.joins(:movies).count
    # @address = orders_count
  end

  def exercise4 
    # 一番お金を使っている顧客を返すこと
    #   * joinsを使うこと
    #   * 取得したCustomerのインスタンスにfoods_price_sumと呼びかけると合計金額を返すこと
    # @customer.joins.(:).order(foods{: price: :asc))
    # @customer = Customer.foods_price_sum
  end
end
