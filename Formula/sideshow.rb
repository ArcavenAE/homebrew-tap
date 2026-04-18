class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260418.225926.2ebbfa3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-225926-2ebbfa3/sideshow-darwin-arm64"
    sha256 "f6d65f0b4bf883d7486b446ce8cfbf9df0f96fa55ad651926ab8cf99abe7d00b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-225926-2ebbfa3/sideshow-darwin-amd64"
    sha256 "ce0ecab6419c2c50d0273919686d22fc33a22f7d1e3b15c0d6250a71c072dcd0"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260418-225926-2ebbfa3/sideshow-linux-amd64"
    sha256 "60309519bf5493bc79a9c6704a697ac6fa53e013782dca4baee5884a8190b8be"
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
