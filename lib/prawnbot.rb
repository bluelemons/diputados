require 'prawnbot/search'
require 'prawnbot/body'
require 'prawnbot/helpers'
require "i18n/backend/gettext"

module Prawnbot

  class Report < Prawn::Document

    include Resource::Search
    include Resource::Body
    include Resource::Helpers

    def self.setup
      yield self
    end

    cattr_accessor :fsize
    @font_size = 10

    cattr_accessor :header_title
    cattr_accessor :header_subtitle

    cattr_accessor :with_header
    @with_header = true

    cattr_accessor :with_footer
    @with_footer = false

    cattr_accessor :logo

    cattr_accessor :water_print

    cattr_accessor :title_font_size
    cattr_accessor :title_font_color

  end
end
