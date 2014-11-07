require 'gpgme'
require 'json'
require 'rotp'

module Authman

  class OtpGenerator

    def initialize(filename = '~/.authman.asc')
      f = File.expand_path(filename)

      if File.exists?(f) 
        @settings         = JSON.load(GPGME::Crypto.new.decrypt(open(f).read))
        @totps            = @settings.inject({}) { |ts, s| ts[s[0]] = ROTP::TOTP.new(s[1]); ts }
        @max_name_length  = @settings.map { |k,v| k.length }.max
      else
        puts <<-EOS
Unable to open <#{f}> make sure it contains a GPG-encrypted JSON structure of your OTP secrets.
The cleartext file should look like :

{
  "Amazon AWS": "<secret>",
  "Paymium":    "<secret>"
}
        EOS
      end
    end

    def cycle_otps
      @interrupted = false
      trap('INT') { @interrupted = true }

      if @settings
        while(!@interrupted) do
          system('clear')
          puts "-- Cycling one-time passwords, <Ctrl-C> to exit"
          print_current_otps
          sleep(1)
        end

        puts "\nBye!"
      end
    end

    def print_current_otps
      @totps.each { |name, totp| puts "#{"%-#{@max_name_length}.#{@max_name_length}s" % name} : #{totp.now}" }
    end

  end

end
