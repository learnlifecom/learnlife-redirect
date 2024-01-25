# frozen_string_literal: true

require 'rack-host-redirect'

app = Rack::Builder.new do
  map('/healthcheck') do
    run ->(_env) { [200, {}, ['OK']] }
  end
end

run Rack::HostRedirect.new(app, {
                             'learnlife.com' => 'www.learnlife.com',
                             'alliance.learnlife.com' => {
                               host: 'www.learnlife.com',
                               path: '/alliance',
                               query: nil
                             }
                           })
