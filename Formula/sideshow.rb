class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261118.202206.95a062d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-202206-95a062d/sideshow-darwin-arm64"
    sha256 "c48e500977f9022ae6abd8ef2dd273bf579ab776b9b22523b7735ae4f511e6fd"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-202206-95a062d/sideshow-darwin-amd64"
    sha256 "7bab40786128c8eb8a3b4658e027b177cb0e9d89e0e5c84fb20bd2f22cad025f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-202206-95a062d/sideshow-linux-amd64"
    sha256 "92652d702cb44f4fd31f85f6cf615f390fad223ff539f6fe0b9d0f08ed1795bc"
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
