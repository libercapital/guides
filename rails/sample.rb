# bad
users = User.joins(:company).where(status: :active)
users.each do |user|
  puts "Name: #{user.name}"
  puts "Company: #{user.company.name}" # to retrieve user.company.name, each time a call to database is made
end

# good
users = User.includes(:company).where(status: :active)
users.each do |user|
  puts "Name: #{user.name}"
  puts "Company: #{user.company.name}" # the user.company.name is already loaded
end

# good
users = User.joins(:company).where(companies: { status: :onboarded })
users.each do |user|
  puts "Name: #{user.name}"
  puts "Address: #{user.address}"
end

# bad
invoices_ids
invoices_id
# good
invoice_ids

# bad
module Invoice
  class TradeRepository
    def self.orderly(invoice, **options)
      invoice.vendas
             .order(created_at: :asc)
             .includes(:ofertas)
             .ransack(options)
             .result
    end
  end
end
Invoice::TradeRepository.orderly(invoice, prazo_gt: 10)
# good
module Invoice
  class TradeRepository
    def self.orderly(invoice, **options)
      invoice.vendas
             .order(created_at: :asc)
             .ransack(options)
             .result
    end
  end
end
Invoice::TradeRepository.orderly(invoice, prazo_gt: 10).includes(:ofertas)
