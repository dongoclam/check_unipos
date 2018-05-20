module ApplicationHelper
  def index_for index, page
    page = page.to_i <= 0 ? 1 : page.to_i
    index + Settings.paginate.per_page.to_i * (page - 1) + 1
  end

  def active_menu input_path
    return "active" if request.path == input_path
  end

  def active_link value, expected, current_class
    value == expected ? "#{current_class} active" : current_class
  end
end
