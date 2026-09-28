class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.042535.2a56ade"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042535-2a56ade/marvel-darwin-arm64"
    sha256 "30a72306ca8cade89debe8bbf2fdb131587bbe38f314f3802671233c15e002f3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042535-2a56ade/marvel-darwin-amd64"
    sha256 "24a0f1f7381298173fec5abfa6551c63559a5623c86adfe7c537b81820f8761e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042535-2a56ade/marvel-linux-arm64"
    sha256 "d136f3bf2f6817467f08cdf9ecb4f25918d4c9a105a8f4e98cedaaae72901d6e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042535-2a56ade/marvel-linux-amd64"
    sha256 "0e7d041d18a8829273963b0e1801049a1355798b6e7f599140250de25b54c847"
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
