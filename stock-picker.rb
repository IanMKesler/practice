def stock_picker(prices)
    maxProfit = 0
    dates = [0,0]
    for i in 0...prices.length
        for j in i+1...prices.length
            profit = prices[j] - prices[i]
            if profit>maxProfit
            maxProfit, dates[0], dates[1] = profit, i, j
            end
        end
    end
    puts "Buy on day #{dates[0]}, sell on day #{dates[1]} for a profit of $#{maxProfit}."
end

stock_picker([17,3,6,9,15,8,6,1,10])




