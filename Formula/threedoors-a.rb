class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.034059.e264cda"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034059-e264cda/threedoors-a-darwin-arm64"
    sha256 "901acf9e4a27ef87d297beb0cd95acd4fcd7b3a16247d733fda19dde8e294c4d"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034059-e264cda/threedoors-a-darwin-amd64"
    sha256 "7e95e3843afaa0d6e24952b78e94f1f2ba7e0ee62a925d5f93eb39e5a7ac47e3"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-034059-e264cda/threedoors-a-linux-amd64"
    sha256 "001b19e02982176a259d860ecff94f96b8921d9fa19c3f6949b4bd7e4ef35b76"
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
