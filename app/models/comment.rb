class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :body, presence: true, length: { maximum: 200 }

  def template
    ApplicationController.renderer.render partial: 'comments/comment', locals: { comment: self }
  end

end
