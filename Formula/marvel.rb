class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.194550.70abeab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-194550-70abeab/marvel-darwin-arm64"
    sha256 "b5dae9151ccac2a04f9251f1623650fd98e4464066adfa3bb262574daa37b563"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-194550-70abeab/marvel-darwin-amd64"
    sha256 "7262668277b2afa8a9e0e8926c4c6e26d446e7edbe499035c9f95f03447eb4a3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-194550-70abeab/marvel-linux-arm64"
    sha256 "9102182f75020f8f2265b5868a5d8404d249447669eedfcd6acab21b6f61755b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-194550-70abeab/marvel-linux-amd64"
    sha256 "34e634d8e5228d88a080dd6f50a8e3bd2e747d5dcee33c2ae9f760eb5e51212f"
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
