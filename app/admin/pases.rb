ActiveAdmin.register Pase do
  belongs_to :session
  
  filter :ingreso
  
  index do
    column :id
  end
end
