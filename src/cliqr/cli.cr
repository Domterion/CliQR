require "clim"
require "../cliqr"
require "./commands/*"

module Cliqr
  class Cli < Clim
    main do
      desc "A cli qrcode maker written in Crystal, CliQR."
      usage "cliqr [options] [arguments] ..."
      version "Version #{Cliqr::VERSION}"
      option "-i=INPUT", "--input=INPUT", type: String, desc: "The words you want to make a qrcode for. Must be wrapped 'like this'."
      option "-o=OUTPUT", "--output=OUTPUT", type: String, desc: "The output file you want this to save to, if none provided will output to console."
      argument "verb", type: String, desc: "The action you want to perform can be 'gen' or 'generate'"
      run do |opts, args|
        case args.verb
        when "gen", "generate"
          if !opts.input.nil?
            Cliqr::Generate.generate opts.input.as(String), opts.output
          else
            puts "Please add the `--input=''` flag."
          end
        else
        end
      end
    end
  end
end
