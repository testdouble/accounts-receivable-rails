module InvoicesHelper
  def to_money(cents)
    number_to_currency(cents / 100)
  end
end
