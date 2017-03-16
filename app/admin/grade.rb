ActiveAdmin.register Grade do
  permit_params :name, :comment

  index do
    column :name
    column :comment

    actions
  end

  form do |f|
    inputs 'Новый класс' do
      f.input :name
      f.input :comment
    end

    actions
  end

end
