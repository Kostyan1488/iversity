module ShareCoursePopup
  def self.included(base)
    base.class_eval do
      add_locator :close_share_course_popup_link, '#shareCourseModal .close'
    end
  end

  def close_share_course_popup
    log.info 'Close share course popup'
    find(locator :close_share_course_popup_link)

    self.class.given
  end
end