class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.190927.884bc28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-190927-884bc28/marvel-darwin-arm64"
    sha256 "fb570ce470a25a328271c75158e9b4f3dac57a2258aff07bd47f46a3c00245b0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-190927-884bc28/marvel-darwin-amd64"
    sha256 "83eb99150bbdf0557c216ad844c7ece723d7a0ff1f81c4fdf6201216e16e4524"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-190927-884bc28/marvel-linux-arm64"
    sha256 "4d9563f56c8a07f17cb184aafb7eca500e83f3d6826df6f560878b3e30408c58"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-190927-884bc28/marvel-linux-amd64"
    sha256 "0b653ea73af7dc89ae04e27376760d806d2cc9f7614cbe1c898eb16ed10518a2"
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
