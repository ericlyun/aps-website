# Ruby's conda build embeds its compiler commands in RbConfig, so exporting CC
# alone does not affect mkmf. Use Apple's toolchain with the system SDK on macOS.
require "rbconfig"

if RUBY_PLATFORM.include?("darwin")
  # Clang can otherwise find conda's ld on PATH even when clang itself is Apple.
  cc = "#{ENV.fetch('CC')} --ld-path=/usr/bin/ld"
  cxx = "#{ENV.fetch('CXX')} --ld-path=/usr/bin/ld"
  replacements = {
    "CC" => cc,
    "CXX" => cxx,
    "LDSHARED" => "#{cc} -dynamic -bundle",
    "LDSHAREDXX" => "#{cxx} -dynamic -bundle"
  }
  [RbConfig::CONFIG, RbConfig::MAKEFILE_CONFIG].each do |config|
    config.merge!(replacements)
  end
end
