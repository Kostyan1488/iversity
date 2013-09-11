require_relative 'session_menu'
require_relative 'sign_up_popup'

class CoursePage < WebPage
  URL_PATTERN = /#{Regexp.escape(app_url)}\/courses\/.+?$/

  include SessionMenu
  include SignUpPopup

  add_locator :enroll_with_email_link, '.enroll-with-email-link'
  add_locator :share_course_popup,     '#shareCourseModal'

  def has_share_course_popup?
    log.info 'Check that Share course popup is presented'
    first(locator :share_course_popup)
  end

  def enroll_course_with_email(user)
    log.info 'Enroll course with email'
    first(locator :enroll_with_email_link).click
    fill_sign_up_popup(user)
    submit_sign_up_popup

    self.class.given
  end
end