class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.033237.f13e571"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033237-f13e571/marvel-darwin-arm64"
    sha256 "c07f8f6abb710113132bf9f5803f3083b9224f0070ad9b50ebb2a4222f36a9f5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033237-f13e571/marvel-darwin-amd64"
    sha256 "ef43086ca4951913ca72a7f190c2dabf77d1af0183b4b0ae152541809165aab9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033237-f13e571/marvel-linux-arm64"
    sha256 "02225bbccd03d61719abffd79c207aa6493d9706a388df07aae81a36cfde40ff"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-033237-f13e571/marvel-linux-amd64"
    sha256 "ff723a83c997fda058e6f1081fccfe0a6cfe0c519e2aef659e7ab94959482844"
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
