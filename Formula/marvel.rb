class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.192726.50376b2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-192726-50376b2/marvel-darwin-arm64"
    sha256 "36aff33ae64ad3eadf9a59c9f03e634bed65c9282f51807797e4be0ea53dc183"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-192726-50376b2/marvel-darwin-amd64"
    sha256 "70c8343b5406846dde2d1cde65d0c5a50c5560e994b732896bb9eb4477abecbe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-192726-50376b2/marvel-linux-arm64"
    sha256 "92bcffb134c58d7002abde5324ae5b871638ce9e694b51aba7a4bfe5d87e3a8d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-192726-50376b2/marvel-linux-amd64"
    sha256 "0955377b2b7b153092354697aa8782ecac22c6358ac81fcd1fcc1a3ef9b220bc"
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
