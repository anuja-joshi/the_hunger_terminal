# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
company = Company.find_or_create_by(name: 'Josh Software', landline: '020-22228888', subsidy: 50)
admin = User.find_or_create_by(name: 'Seema Jha', role: 'CompanyAdmin', mobile: '9689390777', company_id: company.id, email: 'seema@joshsoftware.com')
employee1 = User.find_or_create_by(name: 'Gautam Rege', role: 'Employee', mobile: '9689390888', company_id: company.id, email: 'gautam@joshsoftware.com')
employee2 = User.find_or_create_by(name: 'Sethupathi Asokan', role: 'Employee', mobile: '9689390555', company_id: company.id, email: 'sethu@joshsoftware.com')

terminal = Terminal.find_or_create_by(name: 'Indori Lal', landline: '0203030292', company_id: company.id)
menu_item1 = MenuItem.find_or_create_by(name: 'Pav Bhaji', price: 120, terminal_id: terminal.id)
menu_item2 = MenuItem.find_or_create_by(name: 'Dal Makhni', price: 100, terminal_id: terminal.id)
menu_item3 = MenuItem.find_or_create_by(name: 'Biryani', price: 90, terminal_id: terminal.id)

terminal1 = Terminal.find_or_create_by(name: 'Dominoes', landline: '0203030293', company_id: company.id)
menu_item4 = MenuItem.find_or_create_by(name: 'Chicken Pizza', price: 120, terminal_id: terminal1.id)
menu_item5 = MenuItem.find_or_create_by(name: 'Stuffed garlic Bread', price: 100, terminal_id: terminal1.id)
menu_item6 = MenuItem.find_or_create_by(name: 'Margarita Pizza', price: 90, terminal_id: terminal1.id)


order = Order.find_or_create_by(date: Time.now, total_cost: 170, user_id: employee1.id)
order_detail1 = OrderDetail.find_or_create_by(menu_item_name: 'Pav Bhaji', menu_item_price: 120, terminal_name: 'Indori Lal', terminal_id: terminal.id, quantity: 1, order_id: order.id)
order_detail2 = OrderDetail.find_or_create_by(menu_item_name: 'Chicken Pizza', menu_item_price: 100, terminal_name: 'Dominoes', terminal_id: terminal1.id, quantity: 1, order_id: order.id)

order1 = Order.find_or_create_by(date: Time.now, total_cost: 280, user_id: employee2.id)
order_detail1 = OrderDetail.find_or_create_by(menu_item_name: 'Pav Bhaji', menu_item_price: 120, terminal_name: 'Indori Lal', terminal_id: terminal.id, quantity: 2, order_id: order1.id)
order_detail2 = OrderDetail.find_or_create_by(menu_item_name: 'Biryani', menu_item_price: 90, terminal_name: 'Indori Lal', terminal_id: terminal.id, quantity: 1, order_id: order1.id)
