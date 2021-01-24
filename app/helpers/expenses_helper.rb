module ExpensesHelper
  def all_expenses_total
    sum = 0
    current_user.expenses.each do |expense|
      sum += expense.amount
    end
    '%.2f' % sum
  end

  def most_recent_expenses
    current_user.expenses.order("created_at DESC")
  end
end
