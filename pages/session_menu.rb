module SessionMenu
  def self.included(base)
    base.class_eval do
      add_locator :login_link,         '#login-link'
      add_locator :sign_up_link,       '#signup-link'
      add_locator :lang_switcher_link, '#lang_switch a'
    end
  end

  def open_sign_up_popup
    log.info 'Open sign up popup'
    find(locator :sign_up_link).click

    self.class.given
  end
end