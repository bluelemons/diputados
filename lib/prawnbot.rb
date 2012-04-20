require 'prawnbot/search'
require 'prawnbot/body'
require 'prawnbot/helpers'
require "i18n/backend/gettext"

module Prawnbot

  class Report < Prawn::Document

    attr_accessor :header_title,
                  :with_header,
                  :with_footer,
                  :fsize,
                  :logo,
                  :water_print

    include Resource::Search
    include Resource::Body
    include Resource::Helpers

    def initialize
      @fsize = 7
      @with_header = true
      @with_footer = true

      super
      self.font_size = @fsize
    end

  end
end
