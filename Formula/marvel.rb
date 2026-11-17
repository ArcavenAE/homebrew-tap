class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.201730.dc97276"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-201730-dc97276/marvel-darwin-arm64"
    sha256 "70fac24501873af828fbe83c851316af2968396163b2fbc7d05abb084926f858"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-201730-dc97276/marvel-darwin-amd64"
    sha256 "1490d50bf72b7634d0929246456bdac29d22381965d2a685a8b41218f6ed2258"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-201730-dc97276/marvel-linux-arm64"
    sha256 "d6ce45402b2c9a452b3f6b08c1209a8b8e331cc67afa9c3c28b77aa55fd67123"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-201730-dc97276/marvel-linux-amd64"
    sha256 "1891ff00e74e4940e035298eadc6c2d0497abc2b5b30218bbcf099bb3757fb44"
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
