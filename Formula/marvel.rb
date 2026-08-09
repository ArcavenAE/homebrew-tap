class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.071403.7391749"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071403-7391749/marvel-darwin-arm64"
    sha256 "2b49b482b3e6e61bd97fc74e381e2c5024f305b7ddb8e0c88d6c1252c8b40900"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071403-7391749/marvel-darwin-amd64"
    sha256 "b151040b5467633112a4cbe966390962d87bbde0f866b917a2b5af5d830ca30f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071403-7391749/marvel-linux-arm64"
    sha256 "c2f01afc003303e952f4361f6bfa637a6ff58c7a509f2298bfcbde31bccdb038"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-071403-7391749/marvel-linux-amd64"
    sha256 "e88a1ab98ccec03e88b16bccf9af00991216eb46786af5bdc4684b3d0cd22fd9"
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
