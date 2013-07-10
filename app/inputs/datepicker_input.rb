class DatepickerInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options[:type] = "text"
    value = input_html_options[:value]
    value ||= object.send(attribute_name) if object.respond_to? attribute_name

    input_html_options[:value] ||= I18n.localize(value) if value.present?
    input_html_classes << "datepicker"

    super # leave StringInput do the real rendering
  end
end