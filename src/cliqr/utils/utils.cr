require "stumpy_png"
require "stumpy_core"
require "magickwand-crystal"
require "qrencode"

module Cliqr
  class Utils
    def self.resize(size : UInt16, output : String)
      if size > 4000
        puts "Invalid `--size` flag, max value can be 4000."
        return
      end
      LibMagick.magickWandGenesis
      wand = LibMagick.newMagickWand

      LibMagick.magickReadImage wand, output
      LibMagick.magickScaleImage wand, size, size
      LibMagick.magickWriteImage wand, output

      puts "Resized #{output}."
    end

    def self.image(qr : QRencode::QRcode, output : String)
      height = qr.width
      width = qr.width
      canvas = StumpyCore::Canvas.new(height, width)

      x = 0
      y = 0
      qr.each_row do |row|
        x += 1
        row.each do |byte|
          # puts "#{x - 1} | #{y}"

          canvas[x - 1, y] = (QRencode::Util.black?(byte) ? StumpyCore::RGBA::BLACK : StumpyCore::RGBA::WHITE)

          y = height - 1 <= y ? 0 : y + 1
        end
      end
      StumpyPNG.write(canvas, output)
      puts "Saved #{output}."
    end

    def self.console(qr : QRencode::QRcode)
      qr.each_row do |row|
        row.each do |byte|
          print (QRencode::Util.black?(byte) ? "\033[40m " : "\033[47m ") * 2
        end
        puts "\033[0m"
      end
    end
  end
end
