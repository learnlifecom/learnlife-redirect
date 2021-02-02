app = Rack::Builder.new do
  map('/') do
    run lambda { |env| [301, {'Location' => 'https://learnlife.com'}, ['Redirecting you to https://learnlife.com']]  }
  end

  map('/healthcheck') do
    run lambda { |env| [200, {}, ['OK']]  }
  end
end

run app
