class UsersController < ApplicationController
  def show
    category = [1,3,5,7]
    current_quantity = [1000,5000,3000,8000]
    months = [ 4, 5, 6, 7, 8, 9 ]
    product_A_sales = [ 1_000_000, 1_200_000, 1_300_000,
      1_400_000, 1_200_000, 1_100_000 ]
    product_B_sales = [   300_000,   500_000,   750_000,
      1_150_000, 1_350_000, 1_600_000 ]
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'ItemXXXの在庫の推移')
      f.xAxis(categories: category)
      f.series(name: '在庫数', data: current_quantity)
    end


    @chart2 = LazyHighCharts::HighChart.new("graph") do |f|
      f.title(text: 'ItemXXXの在庫の推移')
      f.xAxis(categories: category)
      f.series(name: '在庫数', data: current_quantity)
    end

    @chart3 = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "製品別上期売上")
      c.series({
        colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{name: 'A',y: product_A_sales.reduce{|sum,e| sum + e}},
               {name: 'B',y: product_B_sales.reduce{|sum,e| sum + e}}]
      })
      c.plotOptions(pie: {allowPointSelect: true,cursor: 'pointer',dataLabels: {
          enabled: true, format: '{point.name}: {point.percentage:.1f} %',
        }
      })
      # グラフの種類として「パイチャート」を指定
      c.chart(type: "pie")
   end
  end
end
