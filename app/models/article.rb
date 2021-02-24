# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  section    :string           not null
#  author_id  :integer          not null
#  photo_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, :body, :author_id, :photo_id, presence: true
  validates :section, presence: true, inclusion: { in: %w(us politics sports business),
    message: "Can only be in the following sections: us politics sports business"}

  belongs_to :author,
    class_name: :Author,
    foreign_key: :author_id,
    primary_key: :id

  belongs_to :photo,
    class_name: :Photo,
    foreign_key: :photo_id,
    primary_key: :id

end
