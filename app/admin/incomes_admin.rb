Trestle.resource(:incomes) do
  menu do
    item :incomes, icon: "fa fa-star"
  end

  build_instance do |attrs, params|
    scope = params[:month_id] ? Month.find(params[:month_id]).incomes : Income
    scope.new(attrs)
  end
  


  # Customize the table columns shown on the index view.
  #
  table do
    column :title
    column :amount
    column :earner
    column :status
    column :created_at
    column :id
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form dialog: true do |income|
    if income
      hidden_field :month_id
    else
      select :month_id, month.all
    end
  
    text_field :title
    text_field :amount
    text_field :earner
    select :status, ["Realized", "Expected"]
  end
  # form do |income|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:income).permit(:name, ...)
  # end
end
