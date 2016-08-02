require 'spec_helper'
require 'fileutils'

describe Video2gif do
  it 'has a version number' do
    expect(Video2gif::VERSION).not_to be nil
  end
  
  let(:current_dir) {File.dirname(__FILE__)}
  let(:fixture_file) {"#{current_dir}/fixtures/terminator.mp4"}
  let(:file) {Video2gif::Converter.new(fixture_file)}

  describe '#initialize' do
    it 'should create a new object' do
      expect(file).to be_an_instance_of Video2gif::Converter
    end
      
    it 'with path to original file' do
      expect(file.original_file_path).to eq fixture_file
      
    end
  end
  
  describe '#create_screenshots' do
    before {file.create_screenshots}
    
    it 'should create screenshots in tmp folder' do
      expect(File.exist?('tmp/screenshot_001.jpg'))
    end
  end

  describe '#create_gif' do
    before {file.create_screenshots}
    before {file.create_gif}

    it 'should create a gif file in tmp folder' do
      expect(File.exist?('terminator.gif')).to eq true
    end
  end
end
