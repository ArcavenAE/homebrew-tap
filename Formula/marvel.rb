class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.211508.1df684c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-211508-1df684c/marvel-darwin-arm64"
    sha256 "f35b44e60a6962b1a4ec6840b62d2d90650762eec758e6a457d6629161ef53d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-211508-1df684c/marvel-darwin-amd64"
    sha256 "8b179e029036036b5f0668d3c7e6e2d8a85b288af6af42edb4fbb231a3875073"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-211508-1df684c/marvel-linux-arm64"
    sha256 "45dd44220805b820c38e306bd037420f82142319e5131b09484a590c5448df10"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-211508-1df684c/marvel-linux-amd64"
    sha256 "1b631905d7046e653b2a2a6d2f8a58f9e0c41a0ef495f8c831e02856fae18577"
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
