class SortableLink
  include ActionView::Helpers::UrlHelper
  include SemanticIconHelper

  def initialize(title:, columns: [], path:, params: {})
    @title = title
    @columns = columns
    @path = path
    @params = params
  end

  def render
    link_to link_text, link_full_path
  end

  private

  attr_reader :title, :columns, :path, :params

  def direction
    return 'desc' unless params[:sort] && current_columns?
    params[:sort][:direction] == 'asc' ? 'desc' : 'asc'
  end

  def caret
    map = { asc: :down, desc: :up }
    semantic_icon("caret #{map[direction.to_sym]}")
  end

  def link_text
    if params[:sort] && current_columns?
      "#{title}#{caret}".html_safe
    else
      title
    end
  end

  def link_full_path
    [path, params.merge(link_options).to_query].join('?')
  end

  def link_options
    { sort: { columns: columns, direction: direction } }
  end

  def current_columns?
    columns == params[:sort][:columns]
  end
end
