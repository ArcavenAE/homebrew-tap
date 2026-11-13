class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261113.182811.a4e8e6d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-182811-a4e8e6d/marvel-darwin-arm64"
    sha256 "215e9bc2b2e1c337f4916b56546ab608f442e6b3f768620b0fb5a066df04aff6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-182811-a4e8e6d/marvel-darwin-amd64"
    sha256 "a13bc1b5f62b755615d88b9fd7b9d9c5103a817bd023b6c1d43de0c8f641ca65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-182811-a4e8e6d/marvel-linux-arm64"
    sha256 "04193232ed7ec38d1ce5c3e4aa642b94934dd54c3c8620edb80cf93e0064a9a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-182811-a4e8e6d/marvel-linux-amd64"
    sha256 "31d44a7a86795daa7e82a72220bd1b0585a9661a84284629eadb0c38979b01d3"
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
