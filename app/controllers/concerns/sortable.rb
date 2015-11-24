module Sortable
  private

  def sortable_query
    return if params[:sort].blank?
    columns = params[:sort][:columns]
    direction = params[:sort][:direction]
    query_parts = columns.map { |c| [c, direction].join(' ') }
    query_parts.join(', ')
  end
end
