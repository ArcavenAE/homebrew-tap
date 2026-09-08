class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260908.224100.cb9d164"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-224100-cb9d164/sideshow-darwin-arm64"
    sha256 "99f6ac0cf4b1e9f2779ac7056678419ac10d45e902c004dffb5e827a5e59655a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-224100-cb9d164/sideshow-darwin-amd64"
    sha256 "eb2236dccd272bfe4ff3b042ea27759cbce39d733181094fb475a1057ee97c85"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-224100-cb9d164/sideshow-linux-amd64"
    sha256 "f161991ba14fd9dbb58bf478c20450bbc91080edf6f26cbe14aed6d2288e0acd"
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
