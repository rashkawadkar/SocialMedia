class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :mobile, :location, :dob,
            presence: true

  has_many :statuses

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" },
                    default_url: "/images/:style/missing.png"
  validates_attachment :avatar, presence: true,
                        content_type: {content_type: "image/jpeg"}
end
