class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.002929.3f53fe5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002929-3f53fe5/marvel-darwin-arm64"
    sha256 "53332feb02e620b48e609c245a61d870600bd63d7997527daa047647be2ecff7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002929-3f53fe5/marvel-darwin-amd64"
    sha256 "17a54f43de9c5ea23239c717fbede033c10df0a78d2f72f9c384cb9a8f1805c7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002929-3f53fe5/marvel-linux-arm64"
    sha256 "686466c821c747e38cafbf7097a53112ec47138fc9ef7814b368b4b511c06eba"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-002929-3f53fe5/marvel-linux-amd64"
    sha256 "b9206b43a3bbc9c78e7f305ca5bb12757a7dd4f55f28bdc7b3dc7418455f04f3"
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
