class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.013402.be3a92f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-013402-be3a92f/marvel-darwin-arm64"
    sha256 "9e64b325ff5bf81be271bca0a39a2b3020629abd4769050f66e61e8b76675cf4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-013402-be3a92f/marvel-darwin-amd64"
    sha256 "c76a347fb18df27c07bfda217f7caa46722eda02ccd99755e78a41d11b6a5773"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-013402-be3a92f/marvel-linux-arm64"
    sha256 "0d1aaf075d92dfa1b5db11b175e23e59905f984381a8e95512280aacf8f5ef89"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-013402-be3a92f/marvel-linux-amd64"
    sha256 "186fcd0df9a4f73a8364380c61f19c0ab7ae5f45871ff10ae7e6893abf55c395"
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
