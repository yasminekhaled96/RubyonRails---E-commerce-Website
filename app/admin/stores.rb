ActiveAdmin.register Store do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :name, :user_id, :summary
     
    form do |f|
      f.inputs do
        f.input :user_id, as: :select, collection: User.where(seller_role: true).map 
        f.input :name
        f.input :summary
      end
      f.actions
    end
    # or
    #
    # permit_params do
    #   permitted = [:name]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
 
  end
  
