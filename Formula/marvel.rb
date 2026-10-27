class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.031718.8aae6d3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-031718-8aae6d3/marvel-darwin-arm64"
    sha256 "2f7627102b2d13dbbe8b9f5c96462a85a4fa7dad666ea4eac8add0a4fdcd8f1c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-031718-8aae6d3/marvel-darwin-amd64"
    sha256 "b38ff838dbfbeb58e6ea265ae2e337281ab456c21438f62156431cabfc41b2be"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-031718-8aae6d3/marvel-linux-arm64"
    sha256 "20d4c0e646b32f415fae71593333515ca08d4381500b598801742df9576e521c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-031718-8aae6d3/marvel-linux-amd64"
    sha256 "6eb4637bcf5ed2c37d271cd99e34ffe01a6c299f66eac5b885ef79cb10b65b93"
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
