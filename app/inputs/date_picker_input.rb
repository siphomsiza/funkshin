class DatePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type] = "text"
    input_html_options[:value] = @builder.object.send(attribute_name)
    input_html_classes.unshift("form-control")
    input_html_options['data-behaviour'] ='datepicker'

    template.content_tag(:div, class: "input-group date_a_picker pull-left") do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, class: "input-group-addon") do
        template.content_tag(:span,"", class: "glyphicon glyphicon-calendar")
      end
    end
  end
end
