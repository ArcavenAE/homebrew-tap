class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.023432.b3e8aa6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-023432-b3e8aa6/sideshow-darwin-arm64"
    sha256 "5f61049ebe6a42c6f5d48bb787919458b11de3719560e4237babcf9e6111d5de"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-023432-b3e8aa6/sideshow-darwin-amd64"
    sha256 "6b27400e3e36e29c68a0dd3befdf41186aa31c3a160882b877fa8ab798da9b0d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-023432-b3e8aa6/sideshow-linux-amd64"
    sha256 "7a5d58b04b872e0e514fe90eecbfd2e0c4dcd3fefd2c2f34c56d6e426e41ebf0"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
