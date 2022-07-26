class Group < ApplicationRecord

  has_one_attached :group_image

  has_many :group_users
  has_many :users, through: :group_users
  has_many :comments

  validates :group_name, presence: true

  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no-group-image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'no-group-image.jpg', content_type: 'image/jpeg')
    end
    group_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(range,video_type,word)
    if video_type = "映画"
      group = Group.where(video_type:"映画")
      if range = "グループ名"
        @group = group.where("group_name LIKE?","%#{word}%")
      elsif range = "動画タイトル"
        @group = group.where("video_title LIKE?","%#{word}%")
      elsif range = "説明分"
        @group = group.where("introduction LIKE?","%#{word}%")
      elsif range = "すべて"
        group1 = group.where("group_name LIKE?","%#{word}%")
        group2 = group.where("video_title LIKE?","%#{word}%")
        group3 = group.where("introduction LIKE?","%#{word}%")
        @group = group1 + group2 + group3
      end

    elsif video_type = "30分アニメ"
      group = Group.where(video_type:"30分アニメ")
      if range = "グループ名"
        @group = group.where("group_name LIKE?","%#{word}%")
      elsif range = "動画タイトル"
        @group = group.where("video_title LIKE?","%#{word}%")
      elsif range = "説明分"
        @group = group.where("introduction LIKE?","%#{word}%")
      elsif range = "すべて"
        group1 = group.where("group_name LIKE?","%#{word}%")
        group2 = group.where("video_title LIKE?","%#{word}%")
        group3 = group.where("introduction LIKE?","%#{word}%")
        @group = group1 + group2 + group3
      end

    elsif video_type = "ドラマ"
      group = Group.where(video_type:"ドラマ")
      if range = "グループ名"
        @group = group.where("group_name LIKE?","%#{word}%")
      elsif range = "動画タイトル"
        @group = group.where("video_title LIKE?","%#{word}%")
      elsif range = "説明分"
        @group = group.where("introduction LIKE?","%#{word}%")
      elsif range = "すべて"
        group1 = group.where("group_name LIKE?","%#{word}%")
        group2 = group.where("video_title LIKE?","%#{word}%")
        group3 = group.where("introduction LIKE?","%#{word}%")
        @group = group1 + group2 + group3
      end

    elsif video_type = "YouTube"
      group = Group.where(video_type:"YouTube")
      if range = "グループ名"
        @group = group.where("group_name LIKE?","%#{word}%")
      elsif range = "動画タイトル"
        @group = group.where("video_title LIKE?","%#{word}%")
      elsif range = "説明分"
        @group = group.where("introduction LIKE?","%#{word}%")
      elsif range = "すべて"
        group1 = group.where("group_name LIKE?","%#{word}%")
        group2 = group.where("video_title LIKE?","%#{word}%")
        group3 = group.where("introduction LIKE?","%#{word}%")
        @group = group1 + group2 + group3
      end

    elsif video_type = "その他"
      group = Group.where(video_type:"その他")
      if range = "グループ名"
        @group = group.where("group_name LIKE?","%#{word}%")
      elsif range = "動画タイトル"
        @group = group.where("video_title LIKE?","%#{word}%")
      elsif range = "説明分"
        @group = group.where("introduction LIKE?","%#{word}%")
      elsif range = "すべて"
        group1 = group.where("group_name LIKE?","%#{word}%")
        group2 = group.where("video_title LIKE?","%#{word}%")
        group3 = group.where("introduction LIKE?","%#{word}%")
        @group = group1 + group2 + group3
      end
    end
  end

end
