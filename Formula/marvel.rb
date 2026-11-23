class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.215244.77f3d1a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-215244-77f3d1a/marvel-darwin-arm64"
    sha256 "948fcb97d11034d69515d402cae96592b52f1f2f532bc1023b6deed2f3ccb6dd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-215244-77f3d1a/marvel-darwin-amd64"
    sha256 "35d65495f172af48da2b38cd82b3f6accf9c18fd8181d7e75a772763987ca95f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-215244-77f3d1a/marvel-linux-arm64"
    sha256 "bd390845c2254730db60dfcb353038383f468842bbc26426808e24fcd7029d3b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-215244-77f3d1a/marvel-linux-amd64"
    sha256 "6e7a88eb448e2204e47e05f5d9523d738b38ffa6199f7bc9223e8bfb2267b9af"
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
