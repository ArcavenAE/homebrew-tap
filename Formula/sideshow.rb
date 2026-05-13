class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260513.032650.dac731c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032650-dac731c/sideshow-darwin-arm64"
    sha256 "392e587120dd3156fa64bef89d52bfcbebaa32122e3a5ebcee64cc0987993539"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032650-dac731c/sideshow-darwin-amd64"
    sha256 "fd23ec42365308ca88cb4a4cb6e4cb42904d46c522ba23743f2058c7d723d91f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260513-032650-dac731c/sideshow-linux-amd64"
    sha256 "167dd8e38977aeac52874698beb799ff7af23f172306fb6da81c74adcf26ffc2"
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
