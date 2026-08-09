class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.015314.6582421"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015314-6582421/marvel-darwin-arm64"
    sha256 "f0de425c0f7c28fa94d475a207cc8dbfd291eac5ddf7f9ad9c894c56b9d4a81e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015314-6582421/marvel-darwin-amd64"
    sha256 "e4280ceb0ca1757e575e4ee8078f5de9d13c04295dd375ca74e7ea220ae2f2b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015314-6582421/marvel-linux-arm64"
    sha256 "8257f8cc1330ae37f7b8985b8d55a6a2b143bc17b09fad53bfa95624ad91dddf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-015314-6582421/marvel-linux-amd64"
    sha256 "98ecdc7d7b468608727d407c48cd3d27f09d42ce0109441bcdd5c15531730daa"
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
