class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.192816.0f862ea"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-192816-0f862ea/sideshow-darwin-arm64"
    sha256 "c666b2a2b77cec947049d5ee673681bb0dd4e7a8c56ba65c4c1eaf3ac4e39f51"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-192816-0f862ea/sideshow-darwin-amd64"
    sha256 "d785b37a1598202c35d9c0a67ffd6526cf19eee566afda01550de8faffbe39a7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-192816-0f862ea/sideshow-linux-amd64"
    sha256 "4edaa1f4c551f4af88440bacf758c2a1359d7dc378007b2d1a34a6f779c5f909"
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
