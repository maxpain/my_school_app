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
    column :grade_id
    actions
  end

  form do |f|
    inputs 'Новый ученик' do
      f.input :fio
      f.input :birthdate
      f.input :gender, as: :select, collection: [["Male", :male], ["Female", :female]], include_blank: false
      f.input :address
      f.input :phone
      f.input :email
      f.input :password
      #f.input :grade_id, as: :select, collection: Grade.all.pluck(:name)
      f.input :grade_id, as: :select, collection: Grade.all.map{|u| ["#{u.name}", u.id]}, include_blank: false
    end

    actions
  end

end
