class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.191346.d0c9f85"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-191346-d0c9f85/marvel-darwin-arm64"
    sha256 "7d81e8b5e2ca4716d718a624415e914fa02cad0dba9346409902c9e0d2a0ab50"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-191346-d0c9f85/marvel-darwin-amd64"
    sha256 "96e8f1185097a71a85e57590c254a61fc8392ad70211b3c68993905ce9d2d429"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-191346-d0c9f85/marvel-linux-arm64"
    sha256 "f22ebd1e2941b5ed5d1cbc0ddab81b737dcc9b1e7a7107cb924adb2bc50ba884"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-191346-d0c9f85/marvel-linux-amd64"
    sha256 "83b0637d869f6ceb09923ab1446a70e992e6623a2b206d0809a17c8aab75ed47"
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
