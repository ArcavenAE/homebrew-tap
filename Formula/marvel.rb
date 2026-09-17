class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.003346.959bf90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-003346-959bf90/marvel-darwin-arm64"
    sha256 "d0d44934640435ea992acdefe5199dd962ddd3fc28b40026421fabf08d3a603a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-003346-959bf90/marvel-darwin-amd64"
    sha256 "614bdc8f0ec56666a1a83cefdf610490878a482363a0c5aaf22da9a2d3bc93e1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-003346-959bf90/marvel-linux-arm64"
    sha256 "b07d91359fd2c9a471e4e1e01324e8aca9be8be7e5945ca0b8780e83cafaeac2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-003346-959bf90/marvel-linux-amd64"
    sha256 "821ec808685f1d204aaacd5ce134ff421999adb306d7f2bdd77fa445e92a4e5b"
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
