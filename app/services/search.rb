module Search
  class SearchExpense
    def initialize(params)
      @params = params
      @name = current_user.expenses.arel_table[:title]
      # @content = Article.arel_table[:content]
    end

    def find
      if(@params.has_key?(:search))
        current_user.expenses.where(@content.matches("%#{@params[:search]}%"))
               .or(current_user.expenses.where(@name.matches("%#{@params[:search]}%")))
               .paginate(page: @params[:page],per_page:5)
      else
        current_user.expenses.paginate(page: @params[:page],per_page:5)
      end
    end
  end
end