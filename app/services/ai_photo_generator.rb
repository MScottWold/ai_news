class AiPhotoGenerator
  def self.generate_photo(photo)
    new(photo).generate_photo
  end

  def initialize(photo)
    @photo = photo
  end

  def generate_photo
    io_object = StringIO.new(generated_image)
    photo.image.attach(io: io_object, filename: :ai_generated_image)
  end

  private

  attr_reader :photo

  def generated_image
    prompt = I18n.t(
      "prompts.image",
      image_prompt: photo.alt_text,
    )
    OpenAi::DalleGateway.generate_image(prompt: prompt)
  end
end
