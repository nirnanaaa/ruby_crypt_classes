require 'openssl'

class Aes
  ## 256
  def self.encrypt(message, password)
    Base64.encode64(self.encrypt_data(message.to_s.strip, self.key_digest(password), nil, "AES-256-CBC"))
  end

  def self.decrypt(message, password)
    base64_decoded = Base64.decode64(message.to_s.strip)
    self.decrypt_data(base64_decoded, self.key_digest(password), nil, "AES-256-CBC")
  end

  def self.key_digest(password)
    OpenSSL::Digest::SHA256.new(password).digest
  end

  def self.decrypt_data(encrypted_data, key, iv, cipher_type)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.decrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(encrypted_data) + aes.final
  end

  def self.encrypt_data(data, key, iv, cipher_type)
    aes = OpenSSL::Cipher::Cipher.new(cipher_type)
    aes.encrypt
    aes.key = key
    aes.iv = iv if iv != nil
    aes.update(data) + aes.final
  end
end