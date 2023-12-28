# frozen_string_literal: true
require 'csv'
require 'pry'
require_relative 'Investment'

errors =[]
CSV.foreach('data/investment-cust.csv', headers: true) do |row|
  begin
    2.times { Investment.new }
    inv = Investment.find(2)
    binding.pry

    # custodian_forms_received = Date.parse(row[2].to_s)
    # inv.update!(custodian_forms_received:)
    # inv.notify_cache_store
    # inv.reload
    # p inv.custodian_forms_received
  rescue => e
    errors << [e, row[1].to_i]
  end
end
