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
def calculated_rates
  @calculated_rates ||= begin
    financing_date = invoices.first&.venda&.proposta_ganhadora&.pay_up_on
    response = Rates::CalculatorService.new(invoices, funder, financing_date).call
    response.data
  end
end

# bad
def calculated_rates
  return @calculated_rates if defined?(@calculated_rates)

  financing_date = invoices.first&.venda&.proposta_ganhadora&.pay_up_on
  response = Rates::CalculatorService.new(invoices, funder, financing_date).call
  @calculated_rates = response.data
end

# good
def calculated_rates
  @calculated_rates ||= calculate_rates
end

def calculate_rates
  financing_date = invoices.first&.venda&.proposta_ganhadora&.pay_up_on
  response = Rates::CalculatorService.new(invoices, funder, financing_date).call
  response.data
end

# bad
params[:page_number]
params[:per_page]

# good
params[:page]
params[:per]
