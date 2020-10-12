require 'rails_helper'

RSpec.describe Link, type: :model do

    it "Valid if has an original URL and a lookup code" do
      url = "https://www.examplesite.com/articles/understanding-rails"
      link = Link.new(
          original_url: url,
          lookup_code: "1234567"
      )
    
      link.save
    
      expect(link.valid?).to be(true)
    end

    it "invalid if the URL is not formatted properly" do
      url = "udueisiiidididi"
      link = Link.new(
          original_url: url,
          lookup_code: "1234567"
      )
    
      expect(link.valid?).to be(false)
    end

    it "Invalid if it does not have a lookup code" do
      url = "https://www.examplesite.com/articles/understanding-rails"
      link = Link.new(
          original_url: url
      )
    
      expect(link.valid?).to be(false)
    end

    it "Invalid if it does not have original URL" do
      lookup_code = "1234567"
      link = Link.new(
        lookup_code: lookup_code
      )
    
      expect(link.valid?).to be(false)
    end

    it "Invalid if the look up code already exists" do
      lookup_code = "1234567"
      url = "https://www.examplesite.com/articles/understanding-rails"
      link = Link.new(
        lookup_code: lookup_code,
        original_url: url
      )

      link.save

      link_2 = Link.new(
        lookup_code: lookup_code,
        original_url: url + "-now"
      )
    
      expect(link_2.valid?).to be(false)
    end

end
