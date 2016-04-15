guard :rspec, cmd: 'rspec --color' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { 'spec' }
  watch('server.rb') { 'spec/server_spec.rb' }
end

guard :rubocop do
  watch(/%r{.+\.rb$}/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
