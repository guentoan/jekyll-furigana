require "jekyll/furigana/version"

module Jekyll
  module Furigana
    def furigana(html):
      return html unless furi_enabled?

      html.gsub!(/\[(.+?)\|(.+?)\]/, "<ruby><rb>\\1</rb><rp>(</rp><rt>\\2</rt><rp>)</rp></ruby>")
      html
    end

    private

    def furi_enabled?
      @context.registers[:page]['furigana'] == true
    end
  end
end

Liquid::Template.register_filter(Jekyll::Furigana)
