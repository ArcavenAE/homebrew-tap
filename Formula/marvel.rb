class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.182424.119495d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182424-119495d/marvel-darwin-arm64"
    sha256 "ab667f3cc64000fa2e6bde46e33e4db94cacab86c9e95c2ccc84456bd75722d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182424-119495d/marvel-darwin-amd64"
    sha256 "a373817d4475e440fb477b8b42f775f5d10cfe6fe2928d0d530d0249428e5be6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182424-119495d/marvel-linux-arm64"
    sha256 "f23ba61f703fa6dd653024a3a1ebcc178d234c23d0efd4777e80dc1930ea3f27"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182424-119495d/marvel-linux-amd64"
    sha256 "506f92328c17287e5c5fc60a7879eaab18a47d65e3b0a0dcd174f17cdf8b1f25"
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
