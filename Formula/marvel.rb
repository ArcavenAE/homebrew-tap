class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.011358.5e786bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011358-5e786bf/marvel-darwin-arm64"
    sha256 "f86232d32bbf7956fb317a22ad67859ebaacab235e3f1b4872c572dd8d85a38c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011358-5e786bf/marvel-darwin-amd64"
    sha256 "1155109185b021a59f55597edc46b8161d56de0479d704678aadf1722841eebb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011358-5e786bf/marvel-linux-arm64"
    sha256 "fe9f7af900b2f8f4bf783c3fb33a8f2ac83706a759ed7aabc39473cdc261d2ab"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-011358-5e786bf/marvel-linux-amd64"
    sha256 "ecfadfcdf54ac396c9b919b210a9766512f2a4b1b099b3830737881e5543c822"
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
