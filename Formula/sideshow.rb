class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261118.212406.5e06609"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-212406-5e06609/sideshow-darwin-arm64"
    sha256 "15d794d0396365848da0dd321c9c162020f63955726e4317b4a7a6cf81299cdd"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-212406-5e06609/sideshow-darwin-amd64"
    sha256 "6f0883c1737cec48490bf446d9555a297f30ef88d55fe2ae7b2aa056719b4900"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261118-212406-5e06609/sideshow-linux-amd64"
    sha256 "d214d4ed5a13718f3a37fc2aa580486088338520c44b818dd169debb9c82da94"
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
