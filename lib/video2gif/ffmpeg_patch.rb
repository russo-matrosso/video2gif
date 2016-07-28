module FFMPEG
  class Transcoder
    # patched default methods
    # to make able to generate multiply screenshots
    def encoding_succeeded?
      @errors << "no output file created" and return false unless File.exist?(@output_file % 1)
      @errors << "encoded file is invalid" and return false unless encoded.valid?
      true
    end

    def encoded
      @encoded ||= Movie.new(@output_file % 1)
    end
  end
end