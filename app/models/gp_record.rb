class GpRecord < ApplicationRecord
  belongs_to :patient, inverse_of: :injuries_effect

  has_many_attached :pre_index_gp_record_images
  has_many_attached :post_index_gp_record_images
  has_many_attached :pre_accident_hospital_record_images
  has_many_attached :post_accident_hospital_images


  [:pre_index_gp_record_image, :post_index_gp_record_image, :pre_accident_hospital_record_image, :post_accident_hospital_image ].each do |attribute|
    define_method:"#{attribute}_path" do
      return "" if !self.send(attribute).attached?

      if Rails.env.development? || Rails.env.test?
        ActiveStorage::Blob.service.send(:path_for, self.send(attribute).key)
      else
        self.send(attribute).service_url
      end
    end

    define_method:"#{attribute}_amazon_path" do
      path = self.send("#{attribute.to_s}_path")
      tempfile = Tempfile.new([self.send(attribute).filename.base, self.send(attribute).filename.extension])
      tempfile.binmode
      tempfile.write HTTParty.get(path)
      tempfile.close
      tempfile.path
    end
  end
end
