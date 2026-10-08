class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.003502.38286b6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003502-38286b6/marvel-darwin-arm64"
    sha256 "318cce26117aed4efa09adcee723d1d3c26230b72f047a64001f29f1b63e0afa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003502-38286b6/marvel-darwin-amd64"
    sha256 "94283fdecaed4f8353a99b604a02d8d3c2fcf55c33a5e29ba3a5ffe04da272f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003502-38286b6/marvel-linux-arm64"
    sha256 "b541aa42831a266b68092f4afb5e9d4cdb6d9b7274f0bb0a17c218bac32be38f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003502-38286b6/marvel-linux-amd64"
    sha256 "969fa18fd6d3997b12cd2b1a95502d55eb999795255406f635eded41539cfdb5"
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
