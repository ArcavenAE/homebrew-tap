class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.221601.76a909b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-221601-76a909b/marvel-darwin-arm64"
    sha256 "456eccd338dd433187da0e508544bd569c4bf4d132cbd092679498ccdb50f2a2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-221601-76a909b/marvel-darwin-amd64"
    sha256 "0462c6afe09a7933a8fbfc07958fb2b48152bfbc951763c2283b1df737f0bd74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-221601-76a909b/marvel-linux-arm64"
    sha256 "98b03180c22e450dca7113267aa3fd4028887c0437ee19a3fec3e14984abf797"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-221601-76a909b/marvel-linux-amd64"
    sha256 "c177dd6131f25693e64570eb4532c058fb73f8ee1ba6f8214159ea0786b12112"
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
