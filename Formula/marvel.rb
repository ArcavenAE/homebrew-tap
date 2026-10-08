class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.220527.f386e9b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220527-f386e9b/marvel-darwin-arm64"
    sha256 "5637748c0b81e69c090ddf53cc8ec6c902f793d8ea5b9cb8991fac453a175089"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220527-f386e9b/marvel-darwin-amd64"
    sha256 "c326a6a455c6048f89f94a46e9580dade049a8e3d1376d88a893c89359161859"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220527-f386e9b/marvel-linux-arm64"
    sha256 "24128e59e9eec39c656200c4cefba9ce1fb7ef45243e6ed2b813879fa370fb2e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220527-f386e9b/marvel-linux-amd64"
    sha256 "8df2fb5fffde14b583a8bf6e02d46a86f3659839d57ceb47ddab03ea6d1d2d26"
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
