ActiveAdmin.register NotaTipo do
  menu :if => proc{ can?(:create, NotaTipo) }, :parent => "Notas"
end
