class Image < ActiveRecord::Base
  belongs_to :album
  
  validates :tagline, :presence => true
  
  Styles = { :small => "150X150>"}

  has_attached_file :pic, 
                    { :styles => Image::Styles,
                      :convert_options => {
                        :small => "-background white -gravity center -resize 150X150 -extent 150X150 -quality 50"
                      } 
                    }.merge(IMAGE_PATH)
  validates_attachment_size :pic, :less_than => 2.megabytes
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
  
  def cdate
    self.created_at.strftime("%d-%b-%Y") rescue ""
  end
end