class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.062140.e97da16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062140-e97da16/marvel-darwin-arm64"
    sha256 "7d65e44b049cc6cb3fbaafa1bb775acd024a51d5c6e166d4df7f9a6a90f9317a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062140-e97da16/marvel-darwin-amd64"
    sha256 "2f4ebf6eab00c43d071b495a5a89e75e8ff03f8051baea5da53734e756226e48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062140-e97da16/marvel-linux-arm64"
    sha256 "745163b80c65e1c39e551851665621f6883f359d2c7506307e93db46d0c86f00"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062140-e97da16/marvel-linux-amd64"
    sha256 "0c09a331c1c97aae88c4abf3ebf8d3ceb88358c092b6ed5d40337566a801451f"
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
