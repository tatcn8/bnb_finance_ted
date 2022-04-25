Trestle.resource(:goals) do
    menu do
      item :goals, icon: "fa fa-star"
    end
    # Customize the table columns shown on the index view.
    #
    table do
      column :title
      column :initial_value
      column :goal_value
      column :years_to_save
      column :user
      column :id
      actions
    end
  
    # Customize the form fields shown on the new/edit views.
    # #
    form do |goal|
      text_field :title
      text_field :initial_value
      text_field :goal_value
      text_field :years_to_save
      collection_select :user_id, User.all, :id, :email
    end
  
    # By default, all parameters passed to the update and create actions will be
    # permitted. If you do not have full trust in your users, you should explicitly
    # define the list of permitted parameters.
    #
    # For further information, see the Rails documentation on Strong Parameters:
    #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    #
  end
  