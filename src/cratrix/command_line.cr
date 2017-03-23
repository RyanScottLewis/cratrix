require "option_parser"
require "./application"

module Cratrix
  class CommandLine

    def self.run
      new.run
    end

    @application = Application.new
    @option_parser = OptionParser.new

    def initialize
      setup_parser
    end

    def run
      @option_parser.parse!

      @application.run
    end

    protected def setup_parser
      @option_parser.banner = <<-EOS
        Usage: cratrix [options]

        Overview: A Matrix-like text scrolling screen and screen lock

        Commands:

        EOS

      @option_parser.on("-l", "--lock", "Ask for password before exiting and log failed attempts") do
        @application.lock = true
      end

      @option_parser.on("-h", "--help", "Print help message") do
        puts @option_parser
        puts

        exit
      end
    end

  end
end
