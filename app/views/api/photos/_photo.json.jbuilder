json.id photo.id
json.imageUrl photo.image_attached? ? url_for(photo.image.variant(:large)) : nil
json.altText photo.alt_text
