class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.030225.044e574"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-030225-044e574/sideshow-darwin-arm64"
    sha256 "b7158da553eb25009918209077731eca050cf29b7f74f06b011b23cbf37859b7"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-030225-044e574/sideshow-darwin-amd64"
    sha256 "aac4e8c70eedbf521e70ea435f51be46d77942b66a84be882c08748a5bd80127"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-030225-044e574/sideshow-linux-amd64"
    sha256 "603d88905f0c92723c97019ee9ef39901cd58a720846e186df95667d1ec3ce74"
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
