class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.073615.9c1541e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-073615-9c1541e/marvel-darwin-arm64"
    sha256 "1c4668251e8fa3004527c1804b367162fcb34e04eca8bcc6fdc5f77e6a91059d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-073615-9c1541e/marvel-darwin-amd64"
    sha256 "52a36d8a48bc6c6f1ef97a31993ff5c404c38cbf7b1ecdc334e37cb1b104b568"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-073615-9c1541e/marvel-linux-arm64"
    sha256 "1ecd2023a6f4671251955261fa3c15ba0b52815961e25a95546b385918d81b2f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-073615-9c1541e/marvel-linux-amd64"
    sha256 "ab9304dd3b99f0544c066302c590be45c543c49a9864a45e16a7cc57a2acd977"
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
