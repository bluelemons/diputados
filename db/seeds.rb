# encoding: UTF-8
require 'legacy'

Legacy.seed_legacy_databases

AdminUser.find_or_create_by_email("admin@example.com", :password => "password")

