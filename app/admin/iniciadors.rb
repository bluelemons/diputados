ActiveAdmin.register Iniciador do
  menu :if => proc{ can?(:create, Iniciador) }, :parent => "Notas"
end
