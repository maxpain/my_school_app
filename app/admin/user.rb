ActiveAdmin.register User do
  permit_params :id, :fio, :birthdate, :gender, :address, :email, :phone, :role, :currentlatitude, :currentlongitude

index do
    column :id
    column :fio
    column :birthdate
    column :gender
    column :address
    column :email
    column :phone
    column :role
    column :currentlatitude
    actions
  end

  form do |f|
    inputs 'Данные пользователя' do
      f.input :fio
      f.input :birthdate, as: :datepicker, datepicker_options: { min_date: "1980-10-8", max_date: "+3D" }
      f.input :gender, as: :select, collection: [["Male", :male], ["Female", :female]], include_blank: false
      f.input :address
      f.input :email
      f.input :phone
      f.input :password
      f.input :role, as: :select, collection: [['User', :user], ['Admin', :admin], ['Pupil', :pupil], ['Parent', :parent], ['Teacher', :teacher], ['Cashier', :cashier]], include_blank: false
      f.input :currentlatitude
      f.input :currentlongitude

    end
    actions
  end

end
