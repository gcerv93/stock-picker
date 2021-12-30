def stock_picker(array)
  best_buy = 0
  best_sell = 0
  profit = 0

  array.each_with_index do |num, idx|
    curr_best_buy = 0
    curr_best_sell = 0

    prev = num
    curr = array [idx+1]
    break if curr.nil?
    prev < curr ? curr_best_buy = prev : curr_best_buy = curr
    array.each_with_index do |n, i|
      if n > curr_best_buy && i > idx
        curr_best_sell = n if n > curr_best_sell
        if curr_best_sell - curr_best_buy > profit
          profit = curr_best_sell - curr_best_buy
          best_buy = curr_best_buy
          best_sell = curr_best_sell
        else
          profit = profit
        end
      end
    end
  end

  results = []
  results.push(array.index(best_buy), array.index(best_sell))
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([92, 90, 82, 100, 71, 95, 15, 30, 11])
p stock_picker([49, 35, 23, 30, 34, 43, 12, 38, 8])