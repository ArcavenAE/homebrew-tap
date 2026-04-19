class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260419.015238.d9ba561"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-015238-d9ba561/sideshow-darwin-arm64"
    sha256 "4ef80f8bc6fead3839e249414ac44a5036be63efdf8109c171a2aa18b47c7c7a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-015238-d9ba561/sideshow-darwin-amd64"
    sha256 "b9e4688d0f84dd5ad1f259e49b1cc43feb960552ffcd7fe0ae9fd962d6a2427f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260419-015238-d9ba561/sideshow-linux-amd64"
    sha256 "25466a9992f6ab01572b198f840cf4ab5ad548434ec23d425825485e99eecb3c"
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
