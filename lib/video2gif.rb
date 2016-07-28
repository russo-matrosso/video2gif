require "video2gif/version"
require "streamio-ffmpeg"
require "fileutils"
require "video2gif/ffmpeg_patch"

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
      movie.screenshot("#{tmp_folder}/screenshot_%00d.png", vframes: 5)
    end
  end
end
