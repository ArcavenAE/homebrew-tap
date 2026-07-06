class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260706.003948.1c636d5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-003948-1c636d5/sideshow-darwin-arm64"
    sha256 "576c3b1ee691b707022e9e250b57e483feb6b115739de14fe3cc24611173a0ed"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-003948-1c636d5/sideshow-darwin-amd64"
    sha256 "23a5e3b12bf71d34dc415219eff8aae852b2a5ef12d280d2676a0241a51b6e4b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260706-003948-1c636d5/sideshow-linux-amd64"
    sha256 "4432c091875142de67d95264a9c9685f16385d54b43a436748eda992766d47fd"
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
