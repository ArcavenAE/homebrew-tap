class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.210406.17f8b6e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-210406-17f8b6e/marvel-darwin-arm64"
    sha256 "1f9f409ae6bff372c85bdf626b39164f9bc4f0e17c39918c0a5f0ff43c796036"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-210406-17f8b6e/marvel-darwin-amd64"
    sha256 "30cc41437b8d259a47191fd3afe876e66e1059c800ef14fd9d52e5683a3245aa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-210406-17f8b6e/marvel-linux-arm64"
    sha256 "7e9b8d6aef80adf49cf52bd5826605958b2ed87ab3dfe8aa34d573373f5c0f6a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-210406-17f8b6e/marvel-linux-amd64"
    sha256 "cda76d54448a8b7eddc13ce11e41ad048e12376e4c5418c4a0f009e127e6676e"
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
