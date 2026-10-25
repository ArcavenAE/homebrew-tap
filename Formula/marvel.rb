class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.165052.ff52afe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165052-ff52afe/marvel-darwin-arm64"
    sha256 "d45f25391954e8d43d533e44633e6eff5d31d3976e1af10aba61d14f54d899c4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165052-ff52afe/marvel-darwin-amd64"
    sha256 "1e4f3182979f3244cc89b807eb02b96dbbf360f7daa26c37de14011cca2df6f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165052-ff52afe/marvel-linux-arm64"
    sha256 "63a44136ee55c892ad3b62c72564558c682c2317f71047a73a43c5626e543079"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-165052-ff52afe/marvel-linux-amd64"
    sha256 "81a997c25011cc527338c8d758c21aa6d39ef8f4da7fb0b83efbe887c43719b2"
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
