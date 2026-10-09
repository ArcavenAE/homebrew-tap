class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.205354.76a7db9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205354-76a7db9/marvel-darwin-arm64"
    sha256 "8e61acd3b09c7dbddd43c26383e6dd6daac4eb1c451af7df5f3973b3f6fdcce6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205354-76a7db9/marvel-darwin-amd64"
    sha256 "7affedafb1f3a1c0e95adc7fa44e1bf26b37d71be17e0ffe5dbe51906351f31d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205354-76a7db9/marvel-linux-arm64"
    sha256 "53e63dc1c62275027ed4eceee3af88320bb63fc500000f634cf0e17ca8a25f28"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205354-76a7db9/marvel-linux-amd64"
    sha256 "7bcd7db143384a7870446735806251e6f1fe775f1b0f20e0da54a6aa19108d85"
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
