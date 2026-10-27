class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.002808.96bd51a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-002808-96bd51a/marvel-darwin-arm64"
    sha256 "4922ab0bd22792b5729c3b1346aff703d785d98a0a95800fcf6cfa1611f626ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-002808-96bd51a/marvel-darwin-amd64"
    sha256 "51930c701109bad1312c41f4b410bec5786ce10eb7f2c95a0529b5619c0cf2a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-002808-96bd51a/marvel-linux-arm64"
    sha256 "27cc1aedee461eabe5e0adbd3fe5139e14cd68f7d993418f0740633e57cc8547"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-002808-96bd51a/marvel-linux-amd64"
    sha256 "7688f06a016d9bb3a74435e97ed250250e7de52b70658d4f869f4e7a0749bc30"
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
