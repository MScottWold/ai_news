module ActiveStorageHelpers
  def create_image_file_blob(filename: "image.png", content_type: "image/png", metadata: nil)
    fixture_path = Rails.root.join("spec/fixtures/files/#{filename}")

    ActiveStorage::Blob.create_and_upload!(
      io: File.open(fixture_path, "rb"),
      filename: filename,
      content_type: content_type,
      metadata: metadata,
    )
  end
end
