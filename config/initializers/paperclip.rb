# config/initializers/paperclip.rb
if ENV['AWS_ACCESS_KEY_ID']
  Paperclip::Attachment.default_options.merge!(
    :storage => :fog,
    :fog_credentials => {
      :provider => "AWS",
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :fog_directory => ENV["S3_BUCKET_NAME"]
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end