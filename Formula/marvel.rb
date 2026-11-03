class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.105332.062db3f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-105332-062db3f/marvel-darwin-arm64"
    sha256 "2ad858a7b5eefccb3092abd5c9c9d6655b4893bb316c41ba78602254d97876f8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-105332-062db3f/marvel-darwin-amd64"
    sha256 "cb364742011d6cea965c223c8014129b346d7b5ddf65a7e49db35c81396303d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-105332-062db3f/marvel-linux-arm64"
    sha256 "66e717e5e0ca8992edeec7a411e4b6425a050a79ea7f29e914a11fe6019ee005"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-105332-062db3f/marvel-linux-amd64"
    sha256 "a9e20a005395854d0c7f4d99666447b5ea01328fed75004cba7f4dc25570ccc1"
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
