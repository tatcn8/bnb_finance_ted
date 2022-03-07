class ExpensesController < ApplicationController
    def create
        @month = Month.find(params[:month_id])
        @expense = @month.expenses.create(expense_params)
        redirect_to month_path(@month)
      end
    
      def destroy
        @month = Month.find(params[:month_id])
        @expense = @month.expenses.find(params[:id])
        @expense.destroy
        redirect_to month_path(@month), status: 303
      end
    
      private
        def expense_params
          params.require(:expense).permit(:title, :amount, :status)
        end
    end