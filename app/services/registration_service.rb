class RegistrationService
  require "securerandom"
  require "open-uri"

  def initialize(user)
    @user = user
  end

  def register
    capitalize_name!
    create_short_url
    scrape_website
  end

  private
    def capitalize_name!
      @user.name.capitalize!
    end

    def create_short_url
      @user.short_url = "http://#{SecureRandom.hex(3)}.#{SecureRandom.hex(1)}"
    end

    def scrape_website
      begin
        doc = Nokogiri::HTML(open(@user.website))
        doc.css('h1', 'h2', 'h3').each do |header|
          @user.scraped_content << "#{header.text.downcase} | "
        end
        @user.scraped_content.chomp!(" | ")
      rescue
        @user.website = nil
      end
    end
end
