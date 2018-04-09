module ApplicationHelper
  def index_for index, page
    page = page.to_i <= 0 ? 1 : page.to_i
    index + Settings.paginate.per_page.to_i * (page - 1) + 1
  end
end
