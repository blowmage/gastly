module Gastly
  class Image
    attr_reader :image

    # @param image [Vips::Image] Instance of Vips::Image
    def initialize(image)
      @image = image
    end

    # @param width [Fixnum] Image width
    # @param height [Fixnum] Image height
    def resize(width:, height:)
      image.thumbnail_image(width, height: height)
    end

    # @param width [Fixnum] Crop width
    # @param height [Fixnum] Crop height
    # @param x [Fixnum] Crop x offset
    # @param y [Fixnum] Crop y offset
    def crop(width:, height:, x:, y:)
      image.crop(x, y, width, height)
    end

    # @param ext [String] Image extension
    # @return [Vips::Image] Instance
    def format(ext)
      # no-op
      warn("Gastly::Image#format is deprecated.")
      image
    end

    # @param output [String] Full path to image
    # @return [String] Full path to image
    def save(output)
      image.write_to_file(output)
      output
    end
  end
end
