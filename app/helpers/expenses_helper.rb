module ExpensesHelper
  def all_expenses_total(expenses)
    '%.2f' % expenses.sum(:amount)
  end

  def most_recent_expenses(expenses)
    expenses.order("expenses.created_at DESC")
  end

  def display_existing_image(expense)
    unless expense.groups.first == nil
      if expense.groups.first.image.attached?
        render :partial => "expense_image", locals: {expense: expense}
      end
    end
  end
end
