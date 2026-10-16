class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.213107.b16f1f3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-213107-b16f1f3/marvel-darwin-arm64"
    sha256 "15f4df73f081df05f867c4e32d42014d182352849963122ba1391d6e097b4a84"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-213107-b16f1f3/marvel-darwin-amd64"
    sha256 "2302726b4c133d6770cb045590235fa998727e69c6dd6f44f8fe6c640d278bc4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-213107-b16f1f3/marvel-linux-arm64"
    sha256 "4ec327d4cc7525c16ed03c1054e03da46a2a931d031640bfa7faf0f50fecd36a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-213107-b16f1f3/marvel-linux-amd64"
    sha256 "06c3f5979ed51827330f6fea33a18b529b0c8f86bad6fc0102884b0ce8225d24"
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
