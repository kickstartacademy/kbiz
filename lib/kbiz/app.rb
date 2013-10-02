require 'kbiz/app/deals'
require 'kbiz/app/frontend'

module Kbiz
  def self.app
    Rack::Builder.new do
      map "/deals" do
        use Kbiz::App::Deals
      end

      run Kbiz::App::Frontend
    end
  end
end
