class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260922.042620.691495b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042620-691495b/threedoors-a-darwin-arm64"
    sha256 "421bec7d92e7b936a59309ff37246ae88c4bf8fedc984587604964aec5b07505"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042620-691495b/threedoors-a-darwin-amd64"
    sha256 "2a913f48a3e62796a26f8a7563a59adab27b756d3ed2ac74a54087bab0aea63a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260922-042620-691495b/threedoors-a-linux-amd64"
    sha256 "a45e2fa1c582c83b510d2506c8a6e8e0e038c43e539416bae21eea7ec56524ba"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
