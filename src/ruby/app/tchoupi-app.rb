ENV['RACK_ENV'] ||= 'development'

# Autoload gems from the Gemfile
require "bundler"
Bundler.require :default, ENV['RACK_ENV'].to_sym

module JsonHelpers
  def json(hash)
    MultiJson.dump(hash, pretty: true)
  end

  def parsed_params
    if request.get? || request.form_data?
      parsed = params
    else
      parsed = MultiJson.load(request.body, symbolize_keys: true)
    end

    parsed = {} unless parsed.is_a?(Hash)

    return parsed
  end
end

module Api
  class Base < ::Sinatra::Base
    set :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }

    configure do
      enable :logging
      enable :raise_errors, :logging
      enable :show_exceptions
      set :static_cache_control, [:private, max_age: 0, must_revalidate: true]

      # Register plugins
      register ::Sinatra::Namespace

      # Set default content type to json
      before do
        content_type :json
      end
    end

    helpers JsonHelpers

    get '/api/version' do
      json({ status: "success", message: "0.1.0"})
    end


  end
end
