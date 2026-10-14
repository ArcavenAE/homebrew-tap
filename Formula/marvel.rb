class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.164611.17230fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164611-17230fb/marvel-darwin-arm64"
    sha256 "25ae0bfe218e691ad0ae085919a2f943c03d9950ec8dfd8094d25a5cd8405cfa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164611-17230fb/marvel-darwin-amd64"
    sha256 "9b55dfb94177d395908aa1ee849f333f37d15c45d3628a64d38fb3e914c5ea86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164611-17230fb/marvel-linux-arm64"
    sha256 "b055ce23fc24edb90cdb76a88aea0d70c93fa10f72d7876a377567f6526577d7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-164611-17230fb/marvel-linux-amd64"
    sha256 "9f202ae2642d8c84792805ba7d4c691240577569168adf7cd53412c969650c85"
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
