class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images#, :dependent => :destroy
  validates :images, :length => { :maximum => 25 }
  
  validates :name,
            :uniqueness => true,
            :length => { :minimum => 2, :maximum => 25 },
            :presence => true
  
  accepts_nested_attributes_for :images, :allow_destroy => true

  def self.search(params)
    albums = Album.all.order("created_at")
    albums = albums.where("name like?", "%#{params[:name]}%") if params[:name].present?
    albums = albums.page(params[:page]).per(20)
    albums
  end  

  def cdate
    self.created_at.strftime("%d-%b-%Y") rescue ""
  end
end