require 'authman/otp_generator'

module Authman

  def self.cycle_otps
    Authman::OtpGenerator.new.cycle_otps
  end

end
