class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.193324.b607548"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-193324-b607548/sideshow-darwin-arm64"
    sha256 "19b0e6f5e6d336508c4dc8dd55c2375e4ce5e800df142d13fd7a135630d684df"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-193324-b607548/sideshow-darwin-amd64"
    sha256 "6be2c9e64a19d1ccb4ffce679a43f6c51ef50bb00d37d8aa246bbca07f74f0d4"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-193324-b607548/sideshow-linux-amd64"
    sha256 "f7cbba9c57d9d2ce1df10c0cc121da9c7929530c8d4d66e6b487f0d9e69fa363"
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
