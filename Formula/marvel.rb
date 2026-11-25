class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261125.012129.e87b121"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-012129-e87b121/marvel-darwin-arm64"
    sha256 "3675d8e06e8c209bb4210f6da321e7ceecfe356ca226912822910b05f7973e1d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-012129-e87b121/marvel-darwin-amd64"
    sha256 "34bb1c294fd8136daf4551572d159a98127e8dde5bc6621b4b4ef58ced9e207d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-012129-e87b121/marvel-linux-arm64"
    sha256 "be2ceedaef5ee16c38d40eae8458a9b055175f8c53fbe6cc5b58a42cb200829a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-012129-e87b121/marvel-linux-amd64"
    sha256 "880c091c98868c58e60a3890c404ce6680e82e74092c104ef5c0a320d44d2755"
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
