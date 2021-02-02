require 'rack-host-redirect'

app = Rack::Builder.new do
  map('/healthcheck') do
    run lambda { |env| [200, {}, ['OK']]  }
  end
end

run Rack::HostRedirect.new(app, {'www.learnlife.com' => 'learnlife.com'})
