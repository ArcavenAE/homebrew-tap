class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.192839.cdb9fdc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-192839-cdb9fdc/marvel-darwin-arm64"
    sha256 "53edfccb380ff85e53d7d902a21981c4ac2c7eec15f96ef90d94d3dfa710a832"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-192839-cdb9fdc/marvel-darwin-amd64"
    sha256 "cee5f010e0c2b252520d118cbb56a9a7ed707980e72e071a4ba77dccdc31048c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-192839-cdb9fdc/marvel-linux-arm64"
    sha256 "4ef33cf452be9f529af4a1fdbefbc193ea90acfca5ee8fc2383839144cc18219"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-192839-cdb9fdc/marvel-linux-amd64"
    sha256 "4397eed2dac6f2a3cb66ebd22ad14e06a8e3869a55ad47c8baa6a1d4a35b7216"
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
