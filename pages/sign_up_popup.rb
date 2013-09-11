module SignUpPopup
  def self.included(base)
    base.class_eval do
      add_field_locator  :user_first_name_field, 'user_first_name'
      add_field_locator  :user_last_name_field,  'user_last_name'
      add_field_locator  :user_email_field,      'user_email'
      add_field_locator  :user_password_field,   'user_password'
      add_button_locator :sign_up_button,        'Sign up'
    end
  end

  def fill_sign_up_popup(user)
    log.info 'Fill sign up popup'

    log.debug "Fill first name field with '#{user.first_name}'"
    fill_in(field_locator(:user_first_name_field), with: user.first_name)

    log.debug "Fill last name field with '#{user.last_name}'"
    fill_in(field_locator(:user_last_name_field), with: user.last_name)

    log.debug "Fill email field with '#{user.email}'"
    fill_in(field_locator(:user_email_field), with: user.email)

    log.debug "Fill password field with '#{user.password}'"
    fill_in(field_locator(:user_password_field), with: user.password)

    self.class.given
  end

  def submit_sign_up_popup
    log.info 'Submit sign up popup'
    click_button(button_locator :sign_up_button)
    sleep settings.timeout_tiny
    wait_for_ajax
    self.class.given
  end
end