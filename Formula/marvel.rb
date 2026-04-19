class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.005645.7f9c387"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-005645-7f9c387/marvel-darwin-arm64"
    sha256 "6d9c596e8dadab1395c3bada01f0f4034bb6e2532849d7ac9d5c4e6c40196bbe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-005645-7f9c387/marvel-darwin-amd64"
    sha256 "0661392fe8469e4732a7d27d79211caf52066cbaa94c0dbdc01c20f13e70e4cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-005645-7f9c387/marvel-linux-arm64"
    sha256 "0ac06c6f542ede924d9f2bca7994fdd97c775023e043a12311bbdf76bb7c5b72"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-005645-7f9c387/marvel-linux-amd64"
    sha256 "8d25e915e8f167f44540e773a81ac26794cd0840b6aef8bbfd6d2b5a6a105f33"
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
