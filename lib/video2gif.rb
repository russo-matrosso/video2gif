require "video2gif/version"
require "streamio-ffmpeg"
require "RMagick"
require "fileutils"

module Video2gif
  class Converter
    attr_accessor :original_file_path

    def initialize(original_file_path)
      @original_file_path = original_file_path
    end
    
    def tmp_folder
      Dir.exist?('tmp') ? 'tmp' : Dir.mkdir('tmp')
    end
    
    def create_screenshots
      movie = FFMPEG::Movie.new(original_file_path)
      movie.screenshot("#{tmp_folder}/screenshot_%d.jpg", {vframes: 20, frame_rate: '1/6'}, validate: false)
    end

    def create_gif
      gif = Magick::ImageList.new(*Dir["#{tmp_folder}/*.jpg"])
      gif.delay = 30
      gif.write('terminator.gif')
    end
  end
end
