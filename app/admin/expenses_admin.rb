Trestle.resource(:expenses) do
  menu do
    item :expenses, icon: "fa fa-star"
  end

  build_instance do |attrs, params|
    scope = params[:month_id] ? Month.find(params[:month_id]).expenses : Expense
    scope.new(attrs)
  end
  
  form dialog: true do |expense|
    text_field :title
    text_field :amount
    select :status, FinanceStatus::VALID_STATUSES
    collection_select :month_id, Month.all, :id, :month
    
  end
  # Customize the table columns shown on the index view.
  #
  table do
    column :month
    column :title
    column :amount
    column :status
    column :created_at
    column :id
    actions
  end

  # Customize the form fields shown on the new/edit views.
  # #
  # form do |expense|
  #   text_field :title
  #   text_field :amount
  #   select :status, ["Expected", "Realized"]
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:expense).permit(:name, ...)
  # end
end
