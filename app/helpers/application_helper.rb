module ApplicationHelper
  def td_css
    "px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
  end

  def btn_css
    "inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
  end

  def active_nav(link_path)
    "border-indigo-500 text-gray-900" if current_page?(link_path)
  end

  def inactive_nav(link_path)
    "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700" if !current_page?(link_path)
  end
end
