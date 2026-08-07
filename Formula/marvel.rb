class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.083411.0463c4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-083411-0463c4e/marvel-darwin-arm64"
    sha256 "9752c141c032fdc378a00cafe751d7fbb3843ac40cdab8a4464282d2153891d5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-083411-0463c4e/marvel-darwin-amd64"
    sha256 "417dc9ab25c1d71a893d8c0859f9e7391d35c721b0df759c079a844de526ff38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-083411-0463c4e/marvel-linux-arm64"
    sha256 "aa172793bf2934c1a22bcc1f629ee118d03509efd4980ddad83f7aaaa05e5a8c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-083411-0463c4e/marvel-linux-amd64"
    sha256 "b0572851055ac89b42be6ce07c36c4dc9807d6b6eb398f7036151a8d8de04341"
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
