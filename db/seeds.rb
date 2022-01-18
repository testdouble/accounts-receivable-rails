# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = Client.create(name:"Acme inc", email: "ap@acme.com")

product_antivirus_software = Product.first_or_create(name: "Anti-virus software", price_cents: 200_00)
product_serverless_servers = Product.first_or_create(name: "Serverless servers", price_cents: 1000_00)

service_programming = Service.first_or_create(name: "Programming", price_cents: 80_00)
service_refactoring = Service.first_or_create(name: "Refactoring", price_cents: 350_00)

invoice_build = Invoice.first_or_create(client: client, net_days: 30, note: "Invoice for writing software for Acme")
invoice_refactor = Invoice.first_or_create(client: client, net_days: 30, note: "Invoice for refactoring software for Acme")

line_item_build_programmer_1 = LineItem.first_or_create(invoice: invoice_build, service: service_programming, quantity: 40, description: "Amber's quality programming")
line_item_build_programmer_2 = LineItem.first_or_create(invoice: invoice_build, service: service_programming, price_override_cents: 40_00, quantity: 40, description: "Justin's discount programming")
line_item_build_servers = LineItem.first_or_create(invoice: invoice_build, product: product_serverless_servers, quantity: 20, description: "Enough serverless hardware to achieve web-scale")
line_item_refactor_consultant = LineItem.first_or_create(invoice: invoice_refactor, service: service_refactoring, quantity: 40, description: "Megan fixing previous discount programming")
line_item_refactor_antivirus = LineItem.first_or_create(invoice: invoice_refactor, product: product_antivirus_software, quantity: 1, description: "Anti-virus software subscription") 

