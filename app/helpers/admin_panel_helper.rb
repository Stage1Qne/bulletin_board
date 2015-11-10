module AdminPanelHelper
  def active_nav_class(expected, *values)
    values.include?(expected) ? 'active' : ''
  end

  def required_field_class(action)
    %w(new create).include?(action) ? 'required' : ''
  end

  def flash_message(class_name, header_text, messages)
    render partial: 'admin_panel/partials/flash_message', locals: {
      class_name: class_name,
      header_text: header_text,
      messages: messages
    }
  end
end
