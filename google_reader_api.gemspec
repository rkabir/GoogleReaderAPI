# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_reader_api}
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Toon Willems"]
  s.date = %q{2011-02-03}
  s.description = %q{a google reader api (unofficial) written in ruby}
  s.email = %q{willemstoon@gmail.com}
  s.extra_rdoc_files = [
    "README.mdown"
  ]
  s.files = [
    "License",
    "README.mdown",
    "Rakefile",
    "VERSION",
    "google_reader_api.gemspec",
    "lib/google-reader-api/api.rb",
    "lib/google-reader-api/cache.rb",
    "lib/google-reader-api/entry.rb",
    "lib/google-reader-api/feed.rb",
    "lib/google-reader-api/google_login.rb",
    "lib/google-reader-api/rss_utils.rb",
    "lib/google-reader-api/subscription_list.rb",
    "lib/google-reader-api/tag.rb",
    "lib/google-reader-api/tag_hash.rb",
    "lib/google-reader-api/user.rb",
    "lib/google_reader_api.rb"
  ]
  s.homepage = %q{http://github.com/nudded/GoogleReaderAPI}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{a google reader api (unofficial) written in ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
    else
      s.add_dependency(%q<hashie>, [">= 0"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 0"])
  end
end

