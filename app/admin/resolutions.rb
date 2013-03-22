ActiveAdmin.register Resolution do
  menu :if => proc{ can?(:manage, Resolution) }
  belongs_to :pase
  
  form do |f|
    f.inputs "Dictamen" do
      f.input :body
    end
    f.buttons
  end

end
