# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
community_1 = Community.create!(name: "Whirlwind Apartments")
community_2 = Community.create!(name: "Villas on the Lake")

user_1 = User.create!(name: "Tonya Harding", email: "tonya@fake.com", username: "skate4life", community_id: 1)
user_2 = User.create!(name: "Luka Doncic", email: "luka@fake.com", username: "lukathaprince", community_id: 1)
user_3 = User.create!(name: "Mikaela Shiffrin", email: "mikaela@fake.com", username: "skiqueen999", community_id: 1)
user_4 = User.create!(name: "Chloe Kim", email: "chloe@fake.com", username: "superpipeslayer34", community_id: 1)
user_5 = User.create!(name: "Dwight Schrute", email: "dwight@fake.com", username: "bearsbeetsbg", community_id: 1)
user_6 = User.create!(name: "Ethel Mertz", email: "ethel@fake.com", username: "sidekicksrock", community_id: 2)
user_7 = User.create!(name: "Lucy Ricardo", email: "lucy@fake.com", username: "grapesandchocolate", community_id: 2)

request_1 = Request.create!(name: "claw hammer", details: "I need a hammer for nothing nefarious.", item_category: "tools", status: 0, borrow_date: '2022-02-15', return_date: '2022-02-16', requested_by_id: user_1.id, community_id: 1)
request_2 = Request.create!(name: "ski mask", details: "will wash and dry before return", item_category: "sporting goods", status: 0, borrow_date: '2022-02-21', return_date: '2022-02-24', requested_by_id: user_5.id, community_id: 1)
request_3 = Request.create!(name: "knife", details: "butcher knife preferred", item_category: "kitchen", status: 0, borrow_date: '2022-02-17', return_date: '2022-02-17', requested_by_id: user_2.id, community_id: 1)
request_4 = Request.create!(name: "blow dart gun", details: "taking a hunting trip", item_category: "sporting goods", status: 1, borrow_date: '2022-02-01', return_date: '2022-02-19', requested_by_id: user_5.id, lender_id: user_1.id, community_id: 1)
request_5 = Request.create!(name: "rope", details: "nylon, 10 feet", item_category: "sporting goods", status: 2, borrow_date: '2022-01-15', return_date: '2022-01-17', requested_by_id: user_3.id, lender_id: user_2.id, community_id: 1)
request_6 = Request.create!(name: "chef hat", details: "will use for chocolate making demo", item_category: "clothing", status: 2, borrow_date: '2022-01-19', return_date: '2022-01-23', requested_by_id: user_7.id, lender_id: user_6.id, community_id: 2)
request_7 = Request.create!(name: "blunt object", details: "not for hitting", item_category: "tools", borrow_date: '2022-01-19', status: 2, return_date: '2022-01-23', requested_by_id: user_7.id, lender_id: user_6.id, community_id: 2)
request_8 = Request.create!(name: "baseball bat", details: "team practice", item_category: "sporting goods", status: 0, borrow_date: '2022-02-18', return_date: '2022-02-23', requested_by_id: user_1.id, community_id: 1)
request_9 = Request.create!(name: "chemistry goggles", details: "prop for a play", item_category: "clothing", status: 1, borrow_date: '2022-02-08', return_date: '2022-02-15', requested_by_id: user_1.id, lender_id: user_4.id, community_id: 1)
request_10 = Request.create!(name: "sledge hammer", details: "Building a fence", item_category: "tools", status: 2, borrow_date: '2022-02-02', return_date: '2022-02-04', requested_by_id: user_2.id, lender_id: user_1.id, community_id: 1)
request_11 = Request.create!(name: "glass cutter", details: "making a stained glass window", item_category: "tools", status: 1, borrow_date: '2022-02-16', return_date: '2022-02-25', requested_by_id: user_1.id, lender_id: user_5.id, community_id: 1)
request_12 = Request.create!(name: "shovel", details: "garden work", item_category: "tools", status: 2, borrow_date: '2022-02-06', return_date: '2022-02-07', requested_by_id: user_3.id, lender_id: user_1.id, community_id: 1)
request_13 = Request.create!(name: "55 gallon drum", details: "storing extra car fluids", item_category: "tools", status: 0, borrow_date: '2022-03-01', return_date: '2023-03-01', requested_by_id: user_1.id, community_id: 1)
request_14 = Request.create!(name: "four tires", details: "need some loaner tires for my Camry", item_category: "automotive", status: 1, borrow_date: '2022-02-28', return_date: '2022-03-15', requested_by_id: user_4.id, lender_id: user_2.id, community_id: 1)
request_15 = Request.create!(name: "winch", details: "lifting an engine block out", item_category: "tools", status: 1, borrow_date: '2022-02-23', return_date: '2022-02-28', requested_by_id: user_4.id, lender_id: user_3.id, community_id: 1)
request_16 = Request.create!(name: "scythe", details: "cutting the tall grass", item_category: "tools", status: 0, borrow_date: '2022-03-15', return_date: '2022-03-25', requested_by_id: user_3.id, community_id: 1)
request_17 = Request.create!(name: "katana", details: "cake cutting ceremony", item_category: "sporting goods", status: 1, borrow_date: '2022-02-10', return_date: '2022-02-18', requested_by_id: user_4.id, lender_id: user_5.id, community_id: 1)
request_18 = Request.create!(name: "black turtle neck sweater", details: "Steve Jobs costume", item_category: "clothing", status: 2, borrow_date: '2022-01-15', return_date: '2022-01-18', requested_by_id: user_5.id, lender_id: user_1.id, community_id: 1)
