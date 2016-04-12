class TimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type] = "text"
    input_html_options[:value] = @builder.object.send(attribute_name)
    input_html_classes.unshift("form-control")
    input_html_options['data-behaviour'] ='datepicker'

    template.content_tag(:div, class: "input-group date timepicker col-sm-4",style: "padding-left: 15px;") do
      @builder.text_field(attribute_name, input_html_options) +
      template.content_tag(:span, class: "input-group-addon") do
        template.content_tag(:span,"", class: "glyphicon glyphicon-time")
      end
    end
  end
end
