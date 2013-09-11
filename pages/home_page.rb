require_relative 'session_menu'
require_relative 'sign_up_popup'

class HomePage < WebPage
  URL = '/'
  URL_PATTERN = /#{Regexp.escape(app_url)}\/?$/
  COURSE_ITEMS_COUNT = 10

  include SessionMenu
  include SignUpPopup

  add_locator :course_list,  '.course-list-item-small h2 a'

  def has_course_catalogue?
    log.info 'Check course catalogue'
    course_list = all(locator :course_list)
    log.debug "Course catalogue: #{course_list.map {|item| item.text}}"
    course_list.size == COURSE_ITEMS_COUNT
  end

  def select_random_course
    element = all(locator :course_list).sample
    log.info "Open course '#{element.text}'"
    element.click

    CoursePage.given
  end
end