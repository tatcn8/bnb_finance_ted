Trestle.resource(:months) do
  menu do
    item :months, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :month
    column :year
    column :user
    column :created_at
    column :id
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |month|
    tab :month do
      text_field :month
      text_field :year
      select :status, ["public"] 
      collection_select :user_id, User.all, :id, :email
    end

    tab :incomes, badge: month.incomes.size do
      table IncomesAdmin.tables[:index], collection: month.incomes 
      concat admin_link_to("New Income", admin: :incomes, action: :new, params: { month_id: month }, class: "btn btn-success")
    end
    tab :expenses, badge: month.expenses.size do
      table ExpensesAdmin.tables[:index], collection: month.expenses
      concat admin_link_to("New Expense", admin: :expenses, action: :new, params: { month_id: month }, class: "btn btn-success")
    end
  end
  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:month).permit(:name, ...)
  # end
end
