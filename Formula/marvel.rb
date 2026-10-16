class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.153024.da6de32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-153024-da6de32/marvel-darwin-arm64"
    sha256 "5fee412e509a21e65fed4b83fca2744937686efb34d759274eaafedcb7be4903"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-153024-da6de32/marvel-darwin-amd64"
    sha256 "0c3e120ff25147e4075f9dc673b296410a6ae32c18275414a97eff981120f39d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-153024-da6de32/marvel-linux-arm64"
    sha256 "9073efe0f63e990dab0302c3f2a8b9f8d70764f424c5e4301c7ad3c4529c04b0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-153024-da6de32/marvel-linux-amd64"
    sha256 "b2a8d33090bed93b6041732dedf0bd7c037cac944ffb01e47429fe6ed4bcaff6"
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
