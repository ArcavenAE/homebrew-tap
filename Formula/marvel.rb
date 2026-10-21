class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.160502.7d35c90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-160502-7d35c90/marvel-darwin-arm64"
    sha256 "cd6ce47e892da0fde90867e75a179751f3ba115bdb08f7baad5d6d33e51604c1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-160502-7d35c90/marvel-darwin-amd64"
    sha256 "fc28e1c033df2ba84dff296d503015588a0d65bf5fb92ec8f95fe3101bf382b7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-160502-7d35c90/marvel-linux-arm64"
    sha256 "f9c2d1e1fc2c1d8c8ecc98b46df9a3cf660df30e46343b9f0ddddbec23634e9e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-160502-7d35c90/marvel-linux-amd64"
    sha256 "675901abb8cb94b23771f908ff70a69cd8cb9ce197909ffb0f02c87d6560e410"
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
