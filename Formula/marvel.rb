class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.005727.46eeb53"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005727-46eeb53/marvel-darwin-arm64"
    sha256 "a9775dd13b97f26985de7212cce9ecb7e85abf64da39d73489feaa2ea5c3fdca"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005727-46eeb53/marvel-darwin-amd64"
    sha256 "8c9673b68eaa0552fd1aa512ac641f2f1ef83e9f415667b07e5d1add232a7445"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005727-46eeb53/marvel-linux-arm64"
    sha256 "f6e110612bc55d76116681838bdaa7112fa733e13e2ac3e74d14d82915999055"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-005727-46eeb53/marvel-linux-amd64"
    sha256 "f740b4a6567036bd64dc98f1505cde7f8772f572abe3aa4762fd1de673c82d3e"
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
