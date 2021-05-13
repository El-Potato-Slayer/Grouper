module ExpensesHelper
  def most_recent_expenses(expenses)
    expenses.order('expenses.created_at DESC')
  end

  def display_existing_image(expense)
    return render partial: 'expense_image', locals: { expense: expense } unless expense.groups.first.nil?
  end
end
