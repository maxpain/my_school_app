ActiveAdmin.register User do
  permit_params :fio, :birthdate, :gender, :address, :email, :phone, :role

index do
    column :fio
    column :birthdate
    column :gender
    column :address
    column :email
    column :phone
    column :role
    #column :encrypted_password
    actions
  end

  form do |f|
    inputs 'Данные пользователя' do
      f.input :fio
      f.input :birthdate
      f.input :gender, as: :select, collection: [["Male", :male], ["Female", :female]], include_blank: false
      f.input :address
      f.input :email
      f.input :phone
      f.input :password
      f.input :role, as: :select, collection: [['User', :user], ['Admin', :admin]], include_blank: false
     # f.input :encrypted_password
    end
    actions
  end

end
