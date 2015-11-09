module AdminPanelHelper
  def active_nav_class(expected, *values)
    values.include?(expected) ? 'active' : ''
  end

  def required_field_class(action)
    %w(new create).include?(action) ? 'required' : ''
  end
end
