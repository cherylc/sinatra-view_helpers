# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-view_helpers}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad W Pry"]
  s.date = %q{2012-05-18}
  s.description = %q{Rails like view helpers}
  s.email = %q{chad.pry@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
     ".gitignore",
     "CHANGES",
     "LICENSE",
     "README.rdoc",
     "lib/sinatra/view_helpers.rb",
     "lib/sinatra/view_helpers/version.rb",
     "Rakefile"
  ]
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = %q{http://github.com/chadwpry/sinatra-view_helpers}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Sinatra Extension that follows a pattern of rails view helpers}
  
  s.add_development_dependency('sinatra')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
end

