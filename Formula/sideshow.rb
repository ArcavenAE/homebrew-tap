class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.021908.844772e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-021908-844772e/sideshow-darwin-arm64"
    sha256 "19c2712e7bafbaca9b2a8fdaf1a772c2e32378719098e940c9b8bd6bddc2ca65"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-021908-844772e/sideshow-darwin-amd64"
    sha256 "85f6cc6089ae9dd01b9790a41818713eb4ba74b1564502a3dd5cc62dfc061d88"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-021908-844772e/sideshow-linux-amd64"
    sha256 "e9c3e7df59c0ccc96daa1c03b91bd89d52d974e0cabf01f1095dd098af5d0e2e"
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
