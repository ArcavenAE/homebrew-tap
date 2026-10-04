class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.184915.57be868"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-184915-57be868/marvel-darwin-arm64"
    sha256 "96e9983dd11477d902da422c899e82569ca8695125e750381cc1c0d548cbc54f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-184915-57be868/marvel-darwin-amd64"
    sha256 "72d7cac7fca38358a898d4d57b370bdb5c4fce63422ffdfb847c49f0c6e59a4c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-184915-57be868/marvel-linux-arm64"
    sha256 "9f24c0f1c8ea3214abd884e501911d4cdc37b9229c9785a83e3981c4a42ece5d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-184915-57be868/marvel-linux-amd64"
    sha256 "e51dad3b94199e5e39d27bf71185801c15c057381b4a0f26780966d312a6ef03"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
