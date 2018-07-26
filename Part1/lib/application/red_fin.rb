module Cucumber
  module Impersonators
    class RedFin

      def method_missing(meth, *args, &block)
        @world.send(meth, *args, &block)
      end

      def initialize(world)
        @world = world
        configure
      end

      def configure
        Capybara.configure do |config|
          config.run_server = false
          config.default_max_wait_time = 15
          config.app_host = host
          config.default_driver = driver
        end
      end

      def driver
        ENV['DRIVER'].to_sym
      end

      def host
        'https://www.redfin.com'
      end

      def open_red_fin
        visit '/'
      end

      def verify_search_result(search_result)
        within("h1.address.inline-block") do
          page.assert_text search_result
        end
      end

    end
  end
end
