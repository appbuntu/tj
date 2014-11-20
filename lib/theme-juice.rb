require "securerandom"
require "fileutils"
require "pathname"
require "tempfile"

###
# Gems
###
require "colorize"
require "artii"
require "thor"

###
# Theme Juice
###
require_relative "theme-juice/plugins/guard"
require_relative "theme-juice/plugins/composer"
require_relative "theme-juice/plugins/vagrant"
require_relative "theme-juice/plugins/mina"
require_relative "theme-juice/version"
require_relative "theme-juice/scaffold"
require_relative "theme-juice/cli"

module ThemeJuice
    class << self

        ###
        # Welcome message
        #
        # @param {String} ascii
        #   Generated ASCII welcome
        # @param {String} color
        #   Color of welcome message
        #
        # @return {Void}
        ###
        def welcome(ascii, color = nil)
            if color.nil?
                puts ascii
            else
                puts "#{ascii}".send "#{color}"
            end
        end

        ###
        # Outputs colorized message to command line
        #
        # @param {String} message
        # @param {String} color
        # @param {String} prefix (!)
        #
        # @return {Void}
        ###
        def message(message, color, prefix = "!")
            puts "[#{prefix}] #{message}".send "#{color}"
        end

        ###
        # Success message
        #
        # @param {String} message
        #
        # @return {Void}
        ###
        def success(message)
            message message, "green"
        end

        ###
        # Warning message
        #
        # @param {String} message
        #
        # @return {Void}
        ###
        def warning(message)
            message message, "yellow"
        end

        ###
        # Error message
        #
        # @param {String} message
        #
        # @return {Void}
        ###
        def error(message)
            message message, "red", "x"
        end

        ###
        # List message
        #
        # @param {String}  item
        # @param {Integer} index
        #
        # @return {Void}
        ###
        def list(item, index)
            message item, "cyan", "#{index}"
        end

        ###
        # Check if program is installed
        #
        # @param {String} program
        #
        # @return {Bool}
        ###
        def installed?(program)
            system "which #{program} > /dev/null 2>&1"
        end
    end
end
