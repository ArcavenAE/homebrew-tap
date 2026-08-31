class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260831.013341.1466313"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260831-013341-1466313/marvel-darwin-arm64"
    sha256 "9863f3733a9db582c1f5746175f7de3101929f4a4d3e19fb6f5a9fa0d01ea07d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260831-013341-1466313/marvel-darwin-amd64"
    sha256 "ecb73d12f18fd4274c5c36fe6706952b8080f84ae756d4f498dbd99b0b75ee06"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260831-013341-1466313/marvel-linux-arm64"
    sha256 "8fa12cdd894dd96ac24bcc9e9e008776c8426893e493f8422e0510360a1abb0a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260831-013341-1466313/marvel-linux-amd64"
    sha256 "8509005bb1ee1cb6e31763fa1513db659d8a7a1b801fe3607156f4b0ff51ea61"
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
