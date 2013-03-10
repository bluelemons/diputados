Dado /^que estoy logeado como "(.*?)"$/ do |user|
  create_user :user_mesa_de_entrada
  sign_in
end

Dado /^que cargo una nota\.$/ do
  @nota = FactoryGirl.build(:notas)
end

Cuando /^selecciono como destino "(.*?)"$/ do |arg1|

end

Cuando /^selecciono como sesión la siguiente sesión$/ do
  pending # express the regexp above with the code you wish you had
end

Entonces /^la nota queda registrada en el "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
