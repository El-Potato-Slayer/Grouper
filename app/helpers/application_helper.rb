module ApplicationHelper
  def all_expenses_total(expenses)
    '%.2f' % expenses.sum(:amount)
  end
end
