require 'openssl'

class Sha1
  def self.hash(text)
    self.hexdigest_data(text.to_s)
  end
  def self.hash_as_digest(text)
    self.digest_data(text.to_s)
  end
  
  private
  
  def self.hexdigest_data(data)
    self.new_sha_instance.hexdigest(data)
  end
  def self.digest_data(data)
    self.new_sha_instance.digest(data)
  end
  def self.new_sha_instance
    OpenSSL::Digest::SHA1.new
  end
end