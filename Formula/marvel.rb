class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.065032.b08033f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065032-b08033f/marvel-darwin-arm64"
    sha256 "91f774f2888bce30e1ad2cec510620166c96388a15ce8aea50314cabb6ae75d4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065032-b08033f/marvel-darwin-amd64"
    sha256 "77a3d05752969d7f06593eefecc6db7f5702be654341ba9103c5e1c5cbdb7e7a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065032-b08033f/marvel-linux-arm64"
    sha256 "4deeac0454f870bb6874f2a38d14a84bee6b43dda3906dc595f4a6600019c67e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065032-b08033f/marvel-linux-amd64"
    sha256 "c14bd68407e02261009f75512d0bd15518433e231622bf88b80ffda908876d45"
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
