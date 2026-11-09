class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.175922.850b367"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-175922-850b367/marvel-darwin-arm64"
    sha256 "4829c259cc5e04d22c7ffaed88408d57d43cfd9012f9611993890566383ef16b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-175922-850b367/marvel-darwin-amd64"
    sha256 "b43ab961d522b3722a3ba093e64eb80f240e4ad45b3696a88d0ab4460cd46c7f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-175922-850b367/marvel-linux-arm64"
    sha256 "76d678d8d43fe50b6de908a605184fe552096e3972a4a68170689db016a064d4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-175922-850b367/marvel-linux-amd64"
    sha256 "d90e69b1409709abd480cbe4d6034fcdefc97aa6584ae0ebf50a28285208a3ed"
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
