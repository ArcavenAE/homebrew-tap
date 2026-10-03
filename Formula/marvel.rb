class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.140350.4169d09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-140350-4169d09/marvel-darwin-arm64"
    sha256 "14f8dfd2a2bd4764d73a03e010a5f4a18333e85d1a2670df8ff0fd5d8e469be0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-140350-4169d09/marvel-darwin-amd64"
    sha256 "66a66176786933dd4de3e0f68dadd2e857d3a381e1c0edb3da31f49b3172b148"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-140350-4169d09/marvel-linux-arm64"
    sha256 "f6b812580e4addf127653506f10cfc93fc36ba8d68de9f8b01ca19664a65e5ec"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-140350-4169d09/marvel-linux-amd64"
    sha256 "e7b8c44640e595b3d17082137fa36cdc013a038353c9ddbfa841846669d89ac7"
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
