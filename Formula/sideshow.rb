class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.020558.12f2b84"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-020558-12f2b84/sideshow-darwin-arm64"
    sha256 "1d3b6907a4829e7681b26ffd5cdb6d98cf220da0d2484d5db58297382abecaf8"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-020558-12f2b84/sideshow-darwin-amd64"
    sha256 "5fc6c6a03e873652f123b1a59b3e727ffddb47c6b14e8202444504298586a4ce"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-020558-12f2b84/sideshow-linux-amd64"
    sha256 "741fa4419fabdd4b762d031d8a48a6f1234d8fffd461a2172f7c67bf1e8d509f"
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
