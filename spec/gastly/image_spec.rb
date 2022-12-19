require 'spec_helper'

RSpec.describe Gastly::Image do
  let(:image) { Vips::Image.pngload(File.expand_path('../../gastly.png', __dir__)) }
  subject { Gastly::Image.new(image) }

  context '#resize' do
    it 'invokes method #resize with arguments' do
      width, height = 100, 100
      expect_any_instance_of(Vips::Image).to receive(:thumbnail_image).with(width, height: height)
      subject.resize(width: 100, height: 100)
    end
  end

  context '#crop' do
    it 'invokes method #crop with arguments' do
      width, height, x, y = 100, 100, 0, 0
      expect_any_instance_of(Vips::Image).to receive(:crop).with(0, 0, 100, 100)
      subject.crop(width: 100, height: 100, x: 0, y: 0)
    end
  end

  context '#format' do
    xit 'invokes method #format' do
      ext = 'png'
      expect_any_instance_of(Vips::Image).to receive(:format).with(ext)
      subject.format(ext)
    end
  end

  context '#save' do
    let(:output) { 'output.png' }
    before do
      expect_any_instance_of(Vips::Image).to receive(:write_to_file).with(output)
    end

    it 'invokes method #write' do
      subject.save(output)
    end

    it 'returns a string' do
      expect(subject.save(output)).to eq output
    end
  end
end