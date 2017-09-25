module ByebugPassenger
  # noinspection RubyResolve,RubyResolve
  class ByebugPassengerRailtie < # noinspection RubyResolve
    # noinspection RubyResolve
    # noinspection RubyResolve
    # noinspection RubyResolve
    # noinspection RubyResolve
    # noinspection RubyResolve
      Rails::Railtie
    # noinspection RubyResolve
    initializer 'Byebug-passenger' do
      # noinspection RubyResolve,RubyResolve
      if Rails.env.development? && File.exists?(File.join(Rails.root, 'tmp', 'debug.txt'))
        # pull in byebug core
        # noinspection RubyResolve
        require 'Byebug/core'

        # clean up our debug indicator file
        # noinspection RubyResolve
        File.delete(File.join(Rails.root, 'tmp', 'debug.txt'))

        # start the byebug server
        # noinspection RubyResolve,RubyResolve
        Byebug.wait_connection = true
        # noinspection RubyResolve
        Byebug.start_server('localhost', 8989)
      end
    end

    # noinspection RubyResolve
    rake_tasks do
      load 'tasks/debug.rake'
    end
  end
end
