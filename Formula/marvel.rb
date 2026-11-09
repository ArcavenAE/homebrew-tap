class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.080341.a3431cc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-080341-a3431cc/marvel-darwin-arm64"
    sha256 "2f80e72c624358c9a9bee8841db70328f796255ea65bb46b4741cafd5fe6cdb0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-080341-a3431cc/marvel-darwin-amd64"
    sha256 "9c07c763288a91b994203250336d1f873364df01976e7c99dc182e3d62558b96"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-080341-a3431cc/marvel-linux-arm64"
    sha256 "2f0b7bf0395300df36d89ba849f5b21aa149faab6e78bd331eeb01618e4a9835"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-080341-a3431cc/marvel-linux-amd64"
    sha256 "eb8d76383feaba320d12edec67311f351341f3d3c2ca496271e12d40ea1f6ecb"
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
