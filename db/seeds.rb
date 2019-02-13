Customer.delete_all
5.times do |t|
  Customer.create!(name: "Customer#{t}")
end

Address.create!(street: "Street1", city: "City1", zip_code: "1111", customer_id: 1)
Address.create!(street: "Street2", city: "City2", zip_code: "1112", customer_id: 2)
Address.create!(street: "Street3", city: "City3", zip_code: "1113", customer_id: 3)
Address.create!(street: "Street4", city: "City4", zip_code: "1114", customer_id: 4)
Address.create!(street: "Street5", city: "City5", zip_code: "1115", customer_id: 5)

Token.create(token: "wjFyD2oQ_ynZB17l4ttveA")