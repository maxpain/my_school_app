ActiveAdmin.register Pupil do
  permit_params :fio, :birthdate, :gender, :address, :phone, :email, :password, :grade_id, :parent_id, :latitude, :longitude, :account

index do
    column :fio
    column :birthdate
    column :address
    column :phone
    column :email
    column :grade_id
    column :parent_id
    column :latitude
    column :longitude
    column :account
    actions
  end

  form do |f|
    inputs 'Новый ученик' do
      f.input :fio
      f.input :birthdate, as: :datepicker, datepicker_options: { min_date: "1980-10-8", max_date: "+3D" }
      f.input :gender, as: :select, collection: [["Male", :male], ["Female", :female]], include_blank: false
      f.input :address
      f.input :phone
      f.input :email
      f.input :password
      #f.input :grade_id, as: :select, collection: Grade.all.pluck(:name)
      f.input :grade_id, as: :select, collection: Grade.all.map{|u| ["#{u.name}", u.id]}, include_blank: false
      f.input :parent_id, as: :select, collection: Parent.all.map{|u| ["#{u.email}, #{u.fio}", u.id]}, include_blank: false
      f.input :latitude
      f.input :longitude
    end

    actions
  end

end
