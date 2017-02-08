ActiveAdmin.register User do
  permit_params :fio, :birthdate, :gender, :address, :email, :phone

index do
    column :fio
    column :birthdate
    column :gender
    column :address
    column :email
    column :phone
    #column :encrypted_password
    actions
  end

  form do |f|
    inputs 'Edit Teacher' do
      f.input :fio
      f.input :birthdate
      f.input :gender
      f.input :address
      f.input :email
      f.input :phone
      f.input :password
     # f.input :encrypted_password
    end
    actions
  end

end
