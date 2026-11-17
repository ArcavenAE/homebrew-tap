class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.191111.b7c1f89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-191111-b7c1f89/marvel-darwin-arm64"
    sha256 "08568ab9f7ba7a25c28a1a53e9bf4e9a8ee04cd89fd0fd9b384f515c71c76548"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-191111-b7c1f89/marvel-darwin-amd64"
    sha256 "45c01db0f9bd9daeb52f379a9cfd397d47ae16c02033f3307ad7c12920496327"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-191111-b7c1f89/marvel-linux-arm64"
    sha256 "f37fc0f250003b68ff5bb24cefdcde750fd3d65c5609c6f8a28ddddc541b80fd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-191111-b7c1f89/marvel-linux-amd64"
    sha256 "0906f44b057257a5eed701533cccd5e9a48382a05af24314262b70a9021ead73"
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
