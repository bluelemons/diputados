ActiveAdmin.register Tag do
  menu :if => proc{ can?(:create, Tag) }, :parent => "Notas"
end
