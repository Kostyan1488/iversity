require 'ffaker'

module Gen
  def self.user(serial=DataGenerator::Gen.serial)
    User.new(serial)
  end

  class User
    attr_reader :first_name, :last_name, :email, :password

    def initialize(serial)
      @first_name = Faker::Name.first_name
      @last_name = Faker::Name.last_name
      @email = "#{settings.gmail_login}+#{serial}@#{settings.gmail_domain}"
      @password = "p#{serial}"
    end
  end
end