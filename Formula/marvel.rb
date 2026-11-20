class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.123118.a43dfb3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-123118-a43dfb3/marvel-darwin-arm64"
    sha256 "52bdf6cb4461b78bb64ad150835c7b9d616bcfabb0bbfdde932d3009772a5a25"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-123118-a43dfb3/marvel-darwin-amd64"
    sha256 "2c51e507e644afc236f189228aca0828a7e233199604961e82c7bb7812bfbf82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-123118-a43dfb3/marvel-linux-arm64"
    sha256 "d95738879a00e58a1ad248bcbd7df8ef426d61de100b2b4fea1f4a31c37c43cc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-123118-a43dfb3/marvel-linux-amd64"
    sha256 "786694471ea6e677ed017e56cac50f10057f269b85efd57eecf356dbee232c01"
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
