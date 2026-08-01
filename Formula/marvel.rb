class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.034213.897e14b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-034213-897e14b/marvel-darwin-arm64"
    sha256 "5d2fcfcf6c1f2b6a703018402ad41e45842d0a964d3a3f16c2fcb41beed647a9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-034213-897e14b/marvel-darwin-amd64"
    sha256 "31069f050a610b54526050a6da14343955eb5072f6884e53fa4005ba5505a78d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-034213-897e14b/marvel-linux-arm64"
    sha256 "0e1f5585822db8f8f795e69e8400b8eb4cc4e996272a366355e0c650cdcb69dc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-034213-897e14b/marvel-linux-amd64"
    sha256 "c4fccbe345b0a8bfdeee23ce9aa1e7dcc4d11c529f831d2e2088f35b1f9d8557"
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
