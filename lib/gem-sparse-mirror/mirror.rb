require 'rubygems/mirror'
require 'yaml'
require 'bundler'

module Gem
  module SparseMirror
    class Mirror < Gem::Mirror
      attr_accessor :only, :except

      def gems
        update_specs unless File.exists?(to(SPECS_FILE))

        gems = Marshal.load(Gem.read_binary(to(SPECS_FILE)))

        if only
          only_with_deps = fetch_specs_using_bundler
          gems = gems.find_all { |name, _, _| only_with_deps.include?(name) }
        end

        gems.reject! { |name, _, _| except.include?(name) }

        gems.map! do |name, ver, plat|
          # If the platform is ruby, it is not in the gem name
          "#{name}-#{ver}#{"-#{plat}" unless plat == RUBY}.gem"
        end
        gems
      end

      def fetch_specs_using_bundler
        fetcher = Bundler::Fetcher.new(from)

        deps = fetcher.fetch_remote_specs(only)
        deps.values.first.map(&:first).uniq
      end
    end
  end
end