require 'spec_helper'

describe 'Base Functionality' do
  let(:user) { Gen.user }

  describe 'Public user' do
    it 'should have access to course catalogue at Home page' do
      HomePage.open.should have_course_catalogue
    end

    it 'should be able to register and enroll for a course' do
      course_page = HomePage.open.select_random_course.enroll_course_with_email(user)
      course_page.should have_share_course_popup
    end
  end

  describe 'Registered user' do
    it 'should have access to Dashboard page' do
      HomePage.open.open_sign_up_popup.fill_sign_up_popup(user).submit_sign_up_popup
      DashboardPage.open.should be_opened
    end
  end
end