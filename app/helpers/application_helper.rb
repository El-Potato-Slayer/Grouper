module ApplicationHelper
  def all_expenses_total(expenses)
    format '%.2f', expenses.sum(:amount)
  end
end
