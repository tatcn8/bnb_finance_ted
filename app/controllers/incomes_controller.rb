class IncomesController < ApplicationController
    def create
        @month = Month.find(params[:month_id])
        @income = @month.incomes.create(income_params)
        redirect_to month_path(@month)
      end
    
      def destroy
        @month = Month.find(params[:month_id])
        @income = @month.incomes.find(params[:id])
        @income.destroy
        redirect_to month_path(@month), status: 303
      end
    
      private
        def income_params
          params.require(:income).permit(:title, :amount, :earner, :status)
        end
    end