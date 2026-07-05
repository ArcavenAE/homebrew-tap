class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260705.080223.7b0dd37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080223-7b0dd37/marvel-darwin-arm64"
    sha256 "278cb0b851a5b067c63a184016c6c747b5e1b4536747258f07fd3674d637154b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080223-7b0dd37/marvel-darwin-amd64"
    sha256 "a11e603a5021175f6d39507a32e37fee2afa134665c6f10ce948f9de8e8185c4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080223-7b0dd37/marvel-linux-arm64"
    sha256 "0334b170fd9ba80d6e0d111c9a3cfc85483553bfb0883272c438027ec3b0bfc4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260705-080223-7b0dd37/marvel-linux-amd64"
    sha256 "30c482cac68acc8bc840ff7d461b01c363d63883d103294dd6817c575d8f62e6"
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
