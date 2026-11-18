class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261118.012121.29a5dac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-012121-29a5dac/sideshow-darwin-arm64"
    sha256 "27c0d2e73baa0c6b18083c1a768c88114c8523981912644be9daea38ff4f7aa7"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-012121-29a5dac/sideshow-darwin-amd64"
    sha256 "718485173ca2658301e64b18d5ed942a45c5ebbdbb97e9fc5ca4b37ae665e301"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-012121-29a5dac/sideshow-linux-amd64"
    sha256 "87209ab1278f3f6b70a2f34e9b49bca0eef83a7c219c7fa5b0d0678506640b15"
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
