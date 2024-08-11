# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }
  validates :user_id, :article_id, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  
  belongs_to :article,
    class_name: :Article,
    foreign_key: :article_id,
    primary_key: :id
end
