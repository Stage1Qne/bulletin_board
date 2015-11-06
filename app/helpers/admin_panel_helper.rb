module AdminPanelHelper
  def active_nav_class(expected, *values)
    values.include?(expected) ? 'active' : ''
  end
end
