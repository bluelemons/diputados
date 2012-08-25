ActiveAdmin.register Area do
    menu :if => proc{ can?(:create, Area) }, :parent => "Notas"
end
