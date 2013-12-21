require 'active_record'
require 'support/money_attribute'
require 'cobudget/entities/account'
require 'cobudget/entities/user'
require 'cobudget/entities/transaction'

module Cobudget
  class Transfer < ActiveRecord::Base
    include MoneyAttribute
    money_attribute :amount

    belongs_to :source_account, class_name: 'Account'
    belongs_to :destination_account, class_name: 'Account'
    belongs_to :creator, class_name: 'User'
    has_many   :transactions
  end
end