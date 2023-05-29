class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_like

  def increment_like
    post.increment!(:likes_counter)
  end

end
