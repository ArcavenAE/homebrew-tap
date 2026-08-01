class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.163628.46ff939"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-163628-46ff939/sideshow-darwin-arm64"
    sha256 "559e74c76188bf55c88250228765e4d9593a1a8d40d0941fa657419b93702a8b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-163628-46ff939/sideshow-darwin-amd64"
    sha256 "43e4f33823231a4b8d8894b9684f1e9fbc73d0dee897429419d8291f7133961b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-163628-46ff939/sideshow-linux-amd64"
    sha256 "550cb00ebc7ff43ced0ec21ec8669e3e715cf498ced6f2a7047709cc3c24c006"
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
