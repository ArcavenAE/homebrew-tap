class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.094913.740115f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094913-740115f/marvel-darwin-arm64"
    sha256 "65b34a15099905ae245806da4464c27d0dd621238222d7a629a10936dfbe09d4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094913-740115f/marvel-darwin-amd64"
    sha256 "cc1937535fb111638e3af1ffe9753276803d51ab8bfbb7a92d5cf04231f4d965"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094913-740115f/marvel-linux-arm64"
    sha256 "f0e4d96e1719d8ae0ad17004259e0d9cda000235181aa734440c1961ae822b2e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-094913-740115f/marvel-linux-amd64"
    sha256 "bf78e26abaad4282b3778410b0f5472e5982722fec08a85d2c0a3827eb4299a6"
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
