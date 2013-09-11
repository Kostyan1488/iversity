require_relative 'session_menu'

class DashboardPage < WebPage
  URL = '/dashboard'
  URL_PATTERN = /#{Regexp.escape(app_url)}\/dashboard$/

  include SessionMenu

  add_locator :courses_list,       '.courses-list'
  add_locator :empty_courses_list, '.well'

  def opened?
    log.info 'Check that dashboard page is opened'
    self.class.given
    first(locator :courses_list) || first(locator :empty_courses_list)
  end
end