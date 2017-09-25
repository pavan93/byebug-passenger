desc 'Tell passenger to restart the application with debugging enabled.'

task :debug do
  # noinspection RubyResolve
  require 'byebug/core'

  # Indicate debugging mode
  # noinspection RubyResolve
  FileUtils.touch(File.join(Rails.root, 'tmp', 'debug.txt'))

  # Tell passenger to restart the application
  # noinspection RubyResolve
  FileUtils.touch(File.join(Rails.root, 'tmp', 'restart.txt'))

  # Wait for restart of application
  puts '(waiting) Please ping any url of your application...'
  begin
    # noinspection RubyResolve
    while File.exists?(File.join(Rails.root, 'tmp', 'debug.txt'))
      sleep 0.5
    end
  rescue Interrupt
    # noinspection RubyResolve
    File.delete(File.join(Rails.root, 'tmp', 'debug.txt'))

    puts 'Cancelled by user; exiting...'
    exit 1
  end

  puts 'Starting Byebug client...'

  begin
    # noinspection RubyResolve,RubyResolve
    Byebug.start_client('localhost', 8989)
  rescue Interrupt
    puts 'Cancelled by user; exiting...'
    exit 1
  end

end
