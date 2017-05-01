ActiveAdmin.register Grade do
  permit_params :name, :teacher_id, :comment

  index do
    column :name
    column :teacher_id
    column :comment
    actions
  end

  form do |f|
    inputs 'Новый класс' do
      f.input :name
      f.input :teacher_id, as: :select, collection: Teacher.all.map{|u| ["#{u.fio}", u.id]}, include_blank: false
      f.input :comment
    end
    actions
  end

end
