class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261122.052325.4da3166"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261122-052325-4da3166/marvel-darwin-arm64"
    sha256 "c45adf0cef95d3a41d2fe96a2f2ba138fa82cd5970c7147101a8c4b92a3d61a8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261122-052325-4da3166/marvel-darwin-amd64"
    sha256 "bb51a2b08a9eb639e49ccf2a8b58b6b7d0c324a750b39e991eaa13b286482f82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261122-052325-4da3166/marvel-linux-arm64"
    sha256 "9069c529c4d55c0b04d3a07cb20d9d71346cd52ed974c2b78acdcfec5d9a7104"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261122-052325-4da3166/marvel-linux-amd64"
    sha256 "3b0222766e5f9a2bdf9151f36ad73b070834f376d8b7e6043b8b73d2658fe289"
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
