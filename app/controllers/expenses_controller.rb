class ExpensesController < ApplicationController
  before_action :set_expense, only: %w[show edit update destroy]

  # GET /expenses
  # GET /expenses.json
  def grouped_expenses_index
    @expenses = current_user.expenses.grouped
  end

  def external_expenses_index
    @expenses = current_user.expenses.ungrouped
  end

  # GET /expenses/new
  def new
    @expense = current_user.expenses.build
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.build(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to :root, notice: 'Expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:author_id, :name, :amount, group_ids: [])
  end
end
