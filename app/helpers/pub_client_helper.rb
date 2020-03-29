module PubClientHelper

  def pub_url(path)
    URI.join(pub_host, path).to_s
  end

  def pub_host
    ENV['PUB_URL'] || "#{Settings.pub.protocol}://#{Settings.pub.host}"
  end

end
