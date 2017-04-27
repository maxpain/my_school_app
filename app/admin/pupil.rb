ActiveAdmin.register Pupil do
  permit_params :fio, :birthdate, :gender, :address, :phone, :email, :password, :grade_id



index do
    column :fio
    column :birthdate
    column :gender
    column :address
    column :phone
    column :email
    column :password
    column :drade_id
    actions
  end

  form do |f|
    inputs 'Новый ученик' do
      f.input :fio
      f.input :birthdate
      f.input :gender, as: :select, collection: ["Male", "Female"]
      f.input :address
      f.input :phone
      f.input :email
      f.input :password
      f.input :grade_id, as: :select, collection: Grade.all.pluck(:name)
    end

    actions
  end

end
