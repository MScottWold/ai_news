require "rails_helper"

RSpec.describe AiPhotoGenerator do
  let(:photo) { build(:photo) }
  let(:image_string) { Faker::Alphanumeric.alpha }
  let(:io_object) { double }

  before do
    allow(OpenAi::Gateway).to receive(:generate_image).
      with(prompt: I18n.t("prompts.image", image_prompt: photo.alt_text)).
      and_return(image_string)
    allow(StringIO).to receive(:new).with(image_string).and_return(io_object)
    allow(photo.image).to receive(:attach)
  end

  describe "::generate_photo" do
    it "attaches the image to the photo" do
      described_class.generate_photo(photo)

      expect(photo.image).to have_received(:attach).
        with(io: io_object, filename: :ai_generated_image)
    end
  end
end
