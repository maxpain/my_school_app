ActiveAdmin.register Teacher do
  permit_params :fio, :birthdate, :gender, :address, :phone, :email, :password

  index do
    column :fio
    column :birthdate
    column :gender
    column :address
    column :phone
    column :email
    column :password
    actions
  end

  form do |f|
    inputs 'Новый учитель' do
      f.input :fio
      f.input :birthdate, as: :datepicker, datepicker_options: { min_date: "1980-10-8", max_date: "+3D" }
      f.input :gender, as: :select, collection: [["Male", :male], ["Female", :female]], include_blank: false
      f.input :address
      f.input :phone
      f.input :email
      f.input :password
    end

    actions
  end

end
