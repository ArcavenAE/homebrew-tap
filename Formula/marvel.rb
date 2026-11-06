class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.071105.b63df7b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-071105-b63df7b/marvel-darwin-arm64"
    sha256 "0e303e7be41b156aa9f09bf3e33226ead51a61c3f1cffb9d89417d51938ba88a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-071105-b63df7b/marvel-darwin-amd64"
    sha256 "e8e4dc51595354d5e3eb367ca2220469cb5d186503cebfd1a2ecedd53db2e69f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-071105-b63df7b/marvel-linux-arm64"
    sha256 "28ca52a38d00a92a53505f599b60b789801471d893f07e31fe4ec2c910d614e3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-071105-b63df7b/marvel-linux-amd64"
    sha256 "9b68f695394b5bc165e993d88b62ee98e8af02ea15a27d0224d903ab1a92ab8a"
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
