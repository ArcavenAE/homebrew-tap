class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.154021.ea47261"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-154021-ea47261/marvel-darwin-arm64"
    sha256 "f9c8706c85fe4984381c052adbe83ebf0d7280826c23e138b1300c235d839ff4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-154021-ea47261/marvel-darwin-amd64"
    sha256 "8a84e547a8f24749888d73d6cd5264b0f4da3ad50acdc47dc9bace27dffb5aab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-154021-ea47261/marvel-linux-arm64"
    sha256 "48637a059722d9ba8b5b048a34849e6f599f6b2407f3a00b3d8c774ae48979b7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-154021-ea47261/marvel-linux-amd64"
    sha256 "11748715ff47140bd73da80a2cd90849032d3e09f3ecc1f5954ca6f299359f2d"
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
