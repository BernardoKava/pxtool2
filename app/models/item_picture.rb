class ItemPicture < ApplicationRecord

  mount_uploader :picture, PictureUploader


  before_create :default_name

  def default_name
      self.name ||= File.basename(picture.filename, '.*').titleize if picture
      self.explicit ||= true
      self.educational ||= false
      self.relevant ||= false
      self.q ||= false
      self.s ||= false
      self.b ||= false
      self.w ||= false
      self.description ||= "This file has been auto-uploaded. This default text can be edited and replaced"
      self.author ||= "None"
  end
end
