require 'pry'
require 'csv'

class Account
  def initialize
    @purchasing_account_balance = purchasing_account_balance
    @business_checking_balance = business_checking_balance
  end

  def purchasing_account_balance
    starting_balance = 0
    CSV.foreach('balances.csv', headers: true) do |row|
      if row["Account"] == "Purchasing Account"
        starting_balance = row["Balance"].to_f
      end
    end
    starting_balance
  end

  def business_checking_balance
    starting_balance = 0
    CSV.foreach('balances.csv', headers: true) do |row|
      if row["Account"] == "Business Checking"
        starting_balance = row["Balance"].to_f
      end
    end
    starting_balance
  end

end



class Transaction
  def initalize
    @action = action
    @transaction_list = transaction_list
  end

  def transaction_list
    transactions = []
    CSV.foreach('bank_data.csv', headers: true) do |row|
      transactions << {date: row["Date"], amount: row["Amount"],
      description: row["Description"], account: row["Account"]}
    end
    transactions
  end

  def deposit?

  end
end

account = Account.new
transaction = Transaction.new

x = transaction.transaction_list
binding.pry





# transactions = []
# CSV.foreach('bank_data.csv', headers: true) do |row|
#   transactions << {date: row["Date"], amount: row["Amount"],
#   description: row["Description"], account: row["Account"]}
# end
# transactions.each do |amount|
#   @account.starting_balance_checking += amount[:amount].to_f
# end






puts "==============Purchasing Amount================"
puts "Starting Balance: #{account.purchasing_account_balance}"
puts "Ending Balace: $637.09"

puts "$29.99   WITHDRAWAL  09/12/2013 - Amazon.com"
puts "$500.33  DEPOSIT     09/14/2013 - Sales Deposit"
puts "$35.19   WITHDRAWAL  09/15/2013 - Staples.com"
puts "==============================================="

puts "==== Business Checking ========================"
puts "Starting Balance: #{account.business_checking_balance}"
puts "Ending Balance:   $923.94"

puts "$60.19   WITHDRAWAL  09/12/2013 - Pizza Pizza"
puts "$400.20  WITHDRAWAL  09/14/2013 - Payroll"
puts "$790.14  DEPOSIT     09/15/2013 - Sales Deposit"
puts "==============================================="
