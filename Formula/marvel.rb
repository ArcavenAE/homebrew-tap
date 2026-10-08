class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.070443.ccb3caf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-070443-ccb3caf/marvel-darwin-arm64"
    sha256 "ea22126b6790d88ca6cd0139bf10b8f97062cae9d0831cf4f4ae7e3c8481d415"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-070443-ccb3caf/marvel-darwin-amd64"
    sha256 "c6f4544531b05b4a917f5bebfcc1225263346594354d0fb4036cc4b36d4c0a3c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-070443-ccb3caf/marvel-linux-arm64"
    sha256 "c52a1a6a5f766389e033db4fa78e5fc612548439b9950ee81ee938521f75c57f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-070443-ccb3caf/marvel-linux-amd64"
    sha256 "85073768133e38d4e881c7ab4922249d34f1d475a40faeda4ca641f322c67758"
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
