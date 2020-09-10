# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-dsl-tk 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "glimmer-dsl-tk".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["andy_maleh".freeze]
  s.date = "2020-09-10"
  s.description = "Glimmer DSL for TK (Ruby Desktop GUI)".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "lib/glimmer-dsl-tk.rb",
    "lib/glimmer/dsl/tk/attribute_expression.rb",
    "lib/glimmer/dsl/tk/dsl.rb",
    "lib/glimmer/dsl/tk/root_expression.rb",
    "lib/glimmer/dsl/tk/widget_expression.rb",
    "lib/glimmer/tk/root_proxy.rb",
    "lib/glimmer/tk/widget_proxy.rb",
    "samples/hello/hello_world.rb"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-dsl-tk".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Glimmer DSL for TK".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<glimmer>.freeze, ["~> 0.10.4"])
    s.add_runtime_dependency(%q<super_module>.freeze, ["~> 1.4.1"])
    s.add_runtime_dependency(%q<puts_debuggerer>.freeze, ["~> 0.10.0"])
    s.add_runtime_dependency(%q<rake-tui>.freeze, [">= 0.2.1"])
    s.add_runtime_dependency(%q<git-glimmer>.freeze, ["= 1.7.0"])
    s.add_runtime_dependency(%q<jeweler>.freeze, [">= 2.3.9", "< 3.0.0"])
    s.add_runtime_dependency(%q<logging>.freeze, [">= 2.3.0", "< 3.0.0"])
    s.add_runtime_dependency(%q<os>.freeze, [">= 1.0.0", "< 2.0.0"])
    s.add_runtime_dependency(%q<rake>.freeze, [">= 10.1.0", "< 14.0.0"])
    s.add_runtime_dependency(%q<text-table>.freeze, [">= 1.2.4", "< 2.0.0"])
    s.add_runtime_dependency(%q<tk>.freeze, ["~> 0.2.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_development_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<glimmer>.freeze, ["~> 0.10.4"])
    s.add_dependency(%q<super_module>.freeze, ["~> 1.4.1"])
    s.add_dependency(%q<puts_debuggerer>.freeze, ["~> 0.10.0"])
    s.add_dependency(%q<rake-tui>.freeze, [">= 0.2.1"])
    s.add_dependency(%q<git-glimmer>.freeze, ["= 1.7.0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 2.3.9", "< 3.0.0"])
    s.add_dependency(%q<logging>.freeze, [">= 2.3.0", "< 3.0.0"])
    s.add_dependency(%q<os>.freeze, [">= 1.0.0", "< 2.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 10.1.0", "< 14.0.0"])
    s.add_dependency(%q<text-table>.freeze, [">= 1.2.4", "< 2.0.0"])
    s.add_dependency(%q<tk>.freeze, ["~> 0.2.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 3.12"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

