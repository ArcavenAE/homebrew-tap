class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.011358.d47c8ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-011358-d47c8ef/sideshow-darwin-arm64"
    sha256 "8b150a99079006fecbffaded563d036227e8b36a0d1813a65bff71b38591f8ba"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-011358-d47c8ef/sideshow-darwin-amd64"
    sha256 "eb824361d25ad07d91d084527d8bc7fe108e5431737c3be49fcd01f8c1017490"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-011358-d47c8ef/sideshow-linux-amd64"
    sha256 "76a7bdd037a0e88613ed2a62c54c72584be680168940a2b789d8517421e4bb9e"
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
