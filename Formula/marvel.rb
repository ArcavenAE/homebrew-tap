class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.192604.844869f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-192604-844869f/marvel-darwin-arm64"
    sha256 "b0c38a0505464617cab4c53eee68589338076ce3f12deacdbb6b785834546fa1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-192604-844869f/marvel-darwin-amd64"
    sha256 "083a83201e0792f3c74d5dc4998c38f9d6819d96b53f711ea9570d8047c0e3b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-192604-844869f/marvel-linux-arm64"
    sha256 "48e7e7a0f696772e677827328997d5748ce90f618f1ae59553d81e10d6bd7d69"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-192604-844869f/marvel-linux-amd64"
    sha256 "db07c14bb4c064ff117fed411033970022144f3e69981aac0399e86c964219f7"
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
