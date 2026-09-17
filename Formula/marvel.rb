class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.134633.f601b6e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134633-f601b6e/marvel-darwin-arm64"
    sha256 "b709713b88f66c8126a3ef24efa3e7dd12b9fd549b87f0bfe8194df7401235b7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134633-f601b6e/marvel-darwin-amd64"
    sha256 "f0d87c27b00e4ecc4d7bc18accaff2ab20cb093b08e633e9bb291d40cb77519a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134633-f601b6e/marvel-linux-arm64"
    sha256 "783b58e2e1646dd287109b4758c27e1974e0d38ca8d9468f3c409c58482befc0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134633-f601b6e/marvel-linux-amd64"
    sha256 "74039364d577cc9ec8a2ab397dfb5df3b16ebe07b2c5cc13a31602ae7fb4c34f"
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
