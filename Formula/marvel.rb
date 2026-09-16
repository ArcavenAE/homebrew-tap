class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.164113.c3a69e1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164113-c3a69e1/marvel-darwin-arm64"
    sha256 "04adbd5ba5dc6b74ba156c9dad06a1d237d4e2f3cbb86748f63698d8a2c467bb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164113-c3a69e1/marvel-darwin-amd64"
    sha256 "12ce6780f7c2db490dcd6ec43bf1fdf38e6c1ea8d414b42102bf7ab2d6f5b774"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164113-c3a69e1/marvel-linux-arm64"
    sha256 "90d91ba431506b64fb05c859b302d485badc150ceb6a6b8441ba35886330f8c2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164113-c3a69e1/marvel-linux-amd64"
    sha256 "e8cf1d2707623f851ab9a16f2d1989333e6538c40c1d5643d55a6afca467338a"
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
