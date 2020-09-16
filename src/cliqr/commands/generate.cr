require "qrencode"
require "stumpy_png"
require "stumpy_core"

module Cliqr
  class Generate
    def self.generate(input : String, output : String?)
      puts "QR code for input #{input}."
      qr = QRencode::QRcode.new input
      if output.nil?
        qr.each_row do |row|
          row.each do |byte|
            print (QRencode::Util.black?(byte) ? "\033[40m " : "\033[47m ") * 2
          end
          puts "\033[0m"
        end
      else
        height = qr.width
        width = qr.width
        canvas = StumpyCore::Canvas.new(height, width)

        x = 0
        y = 0
        qr.each_row do |row|
          x += 1
          row.each do |byte|
            y = height - 1 <= y ? 0 : y + 1

            canvas[x - 1, y] = (QRencode::Util.black?(byte) ? StumpyCore::RGBA::BLACK : StumpyCore::RGBA::WHITE)
          end
        end

        puts "Saving to #{output}."

        StumpyPNG.write(canvas, output)

        puts "Saved the QR code. When scaling make sure there is no smoothing or the code will get blurry."
      end
    end
  end
end
