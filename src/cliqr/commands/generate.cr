require "qrencode"
require "../utils/utils"

module Cliqr
  class Generate
    def self.generate(input : String, output : String?, size : UInt16?)
      puts "QR code for input #{input}."
      qr = QRencode::QRcode.new input, level: QRencode::ECLevel::LOW
      if output.nil?
        Cliqr::Utils.console qr
      else
        Cliqr::Utils.image qr, output

        if !size.nil?
          Cliqr::Utils.resize size, output
        end
      end
      puts "Saved the QR code. When scaling make sure there is no smoothing or the code will get blurry."
    end
  end
end
