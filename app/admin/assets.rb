ActiveAdmin.register Asset do
  belongs_to :expediente

  form :html => {:multipart => true} do |f|
    f.inputs "Details" do
      f.input :asset, :as => :file
    end

    f.buttons

  end
end
