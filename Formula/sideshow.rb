class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.232316.3471f19"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-232316-3471f19/sideshow-darwin-arm64"
    sha256 "527f42fede9445edaf28595b2a5b7764479d16923b5e809629e7ca85d4c1edf4"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-232316-3471f19/sideshow-darwin-amd64"
    sha256 "9c73411a963af95efb09f665812278d48adfa8318806192395ca953afa790117"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-232316-3471f19/sideshow-linux-amd64"
    sha256 "a0966aafdce68700d3842b127151b5653361790ca0a4c6be99e53f6ad5e32f1f"
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
