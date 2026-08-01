class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.004937.6abc317"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-004937-6abc317/sideshow-darwin-arm64"
    sha256 "c17bb09ca8fcbeb87f83e79f5f39e6d4c5a2e8dc70e0af2d4da29715a22ebeeb"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-004937-6abc317/sideshow-darwin-amd64"
    sha256 "47bc7c5f1da9e33ae5659810dc7e4f844d489cb5a2a18fc5e9df07ba325d6a93"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-004937-6abc317/sideshow-linux-amd64"
    sha256 "a4a46f53f93968f42fbd3274cef9e457689c779e4e4459d1bf995c60bb7b3d08"
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
