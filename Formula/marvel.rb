class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261113.065452.e74a50e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-065452-e74a50e/marvel-darwin-arm64"
    sha256 "9e3b89f110d7742c85155c45ef0d38b0151ae6faf50b852def88e43994fc02dd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-065452-e74a50e/marvel-darwin-amd64"
    sha256 "bdd42720463fa9f2ea9b0a476e3f07120a746a7f46be2f281f0612239012c68c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-065452-e74a50e/marvel-linux-arm64"
    sha256 "45d0a45841baa9ace5b2920965db4c3457ce05980470d60d2c50ba6bb74bd874"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-065452-e74a50e/marvel-linux-amd64"
    sha256 "6bf7169ef638b793554c26d2889de643106f1bd0159c0282ec0bb97322e1552a"
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
