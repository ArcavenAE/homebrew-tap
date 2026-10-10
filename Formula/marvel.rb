class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.062315.227b9d8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062315-227b9d8/marvel-darwin-arm64"
    sha256 "2911cb1fb1cb08d3bdff5f52767773cfcde3cef3f2a7a84363ac8bad495da956"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062315-227b9d8/marvel-darwin-amd64"
    sha256 "bed917563651c0ae2af80306b8fff094b2ef0167f8e11378e2846edabb027f8f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062315-227b9d8/marvel-linux-arm64"
    sha256 "36c68be7d192df03037ec7b6edd8292fc4574c91c1a42b6e8c33457888beffd0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062315-227b9d8/marvel-linux-amd64"
    sha256 "7f5ec812bda6dff661ddaa1f5f767cdd014dcda85cb7a0051c47124e7a5d5f54"
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
