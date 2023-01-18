ActiveAdmin.register User do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :email, :password, :password_confirmation, :status, :type, :profession, :service



  index do
    id_column
    column :email
    column :created_at
    actions
  end


  form do |f| 
    f.inputs :username
    f.inputs :email
    f.inputs :password
    f.input :status, :as => :select, collection: (['qualified','not_qualified','banned'])
    f.input :type , :as => :select, collection: (['Novice','Expert'])

    f.inputs :profession
    f.inputs :service
    f.actions            
  end
  
  filter :email
  filter :created_at
  filter :status
  filter :profession
  filter :service
  filter :created_at
  filter :email
  filter :created_at
  




  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :email, :encrypted_password, :status, :type, :profession, :service, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
