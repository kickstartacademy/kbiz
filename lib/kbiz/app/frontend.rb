require 'haml'

module Kbiz
  module App
    class Frontend < Sinatra::Base
      set :views, %w{views}
      set :static, true
      set :public_folder, ::File.join(Dir.pwd, 'public')

      get '/' do
        haml :index
      end
    end
  end
end
