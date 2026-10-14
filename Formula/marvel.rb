class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.195441.4b58654"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-195441-4b58654/marvel-darwin-arm64"
    sha256 "ecde3a465074d3b66cd1c5b957b089aa5004db241bd8e40e08166f9beef62714"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-195441-4b58654/marvel-darwin-amd64"
    sha256 "450c76085d94994f08a489ccb2bc5d8defa92d6f28e6b209e2a8ca880d0e0519"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-195441-4b58654/marvel-linux-arm64"
    sha256 "6c94492fc0c393e1ddadf21f9d0512c7a3b9cbe2404658b045ab779ea71583cd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-195441-4b58654/marvel-linux-amd64"
    sha256 "37a8be50d01dfe503b40e8885b5f6d79721f58ad20b3b57e4c9dce661df6a899"
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
