
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord-create_or_find_by-backport/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-create_or_find_by-backport"
  spec.version       = ActiverecordCreateOrFindByBackport::VERSION
  spec.authors       = ["YusukeIwaki"]
  spec.email         = ["q7w8e9w8q7w8e9@yahoo.co.jp"]

  spec.summary       = %q{Backports create_or_find_by for ActiveRecord}
  spec.homepage      = "https://github.com/YusukeIwaki/activerecord-create_or_find_by-backport"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'activerecord', '>= 4.2.0', '< 6.0.0'
end
