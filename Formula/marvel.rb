class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.164220.e475e9d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164220-e475e9d/marvel-darwin-arm64"
    sha256 "f8c84a51c8d0e937665bc68d09d4cd63d0a4155d3ae25b6abe301e7987d936f7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164220-e475e9d/marvel-darwin-amd64"
    sha256 "d662fa55e70f6ac07c0f8c9991ddcd60daf35d6b6c95630fa9a507850f77f959"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164220-e475e9d/marvel-linux-arm64"
    sha256 "b08475ac6f419f82f6a002f29fc91d69c26ef0b09f2cc62376b6bbf014a45d9b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-164220-e475e9d/marvel-linux-amd64"
    sha256 "a9ba5b3d1b36d8f7c5b8d5418997c292ad6cb89adcaffcd41301b7d7eded480b"
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
