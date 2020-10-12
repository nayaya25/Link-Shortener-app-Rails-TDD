require "rails_helper"

RSpec.describe Shortener do


    it "shortens a given URL to a 7 character look up code" do
        url = "https://www.examplesite.com/articles/understanding-rails"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "It gives each URL a unique look up code" do
        url = "https://www.examplesite.com/articles/understanding-rails"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.examplesite.com/articles/understanding-ruby"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_1).not_to eq(code_2)
    end

    it "Generats a link record with a unique lookup code" do
        url = "https://www.examplesite.com/articles/understanding-rails"
        shortener = Shortener.new(url)
        link = shortener.generate_short_link
        expect(link.valid?).to be(true)

        link_2 = shortener.generate_short_link
        expect(link_2.valid?).to be(true)
    end

end