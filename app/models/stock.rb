class Stock < ApplicationRecord
	

	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		look_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return look_up_stock unless nil
		# byebug
		new_stock = new(ticker: look_up_stock.symbol, name: look_up_stock.name)
		#new_stock.last_price = new_stock.cp
		new_stock
	end

	def price
		begin
			closing_price = StockQuote::Stock.quote(ticker).cp
		rescue
			closing_price = nil
		end
		return "#{closing_price} (Closing)" if closing_price

		begin
			opening_price = StockQuote::Stock.quote(ticker).open
		rescue
			opening_price = nil
		end 
		return "#{opening_price} (Opening)" if opening_price 'Unavailable'
	end
end
