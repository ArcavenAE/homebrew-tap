class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.102050.148b740"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-102050-148b740/marvel-darwin-arm64"
    sha256 "4309700d47375521c2590b937d276a4855716781e8b87bd05e0dc8e14914ced5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-102050-148b740/marvel-darwin-amd64"
    sha256 "d9f1dd779bcfd33bf97f80088f6b516f3e63d39841b54291a14104492c0b7f75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-102050-148b740/marvel-linux-arm64"
    sha256 "10a9764fea0d997937e8d13f688872f41420acc555e6622f0941b2f58abbe94a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-102050-148b740/marvel-linux-amd64"
    sha256 "a34b486f83ce0b007c13ab7c8d87eea43987b656f39cefd2d67929c6d0520bbc"
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
