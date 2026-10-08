class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.130235.c75c189"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-130235-c75c189/sideshow-darwin-arm64"
    sha256 "459454ab956360494442045f149c2b12584c9fc42a50cb45ed5ee730ec113f3e"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-130235-c75c189/sideshow-darwin-amd64"
    sha256 "e22625268e8bbfa9f357099954554912c0062bc5f5a7eb601c059d28d33a85c8"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-130235-c75c189/sideshow-linux-amd64"
    sha256 "a85a036729308e044233b7eb10ecd2bc055e30f30d0d0b7a7d00d3c52bc22b26"
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
