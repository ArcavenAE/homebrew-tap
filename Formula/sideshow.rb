class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261117.200224.bd8e4d4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261117-200224-bd8e4d4/sideshow-darwin-arm64"
    sha256 "a3e0ebe92c4075a79e7d08a4d43d8a28068d2d4842d2a349164d5ca1c739ce0e"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261117-200224-bd8e4d4/sideshow-darwin-amd64"
    sha256 "f6101bf7f7bc1005b8e995afcf377bcc0b1af13592b758dc5758a9ae62234b24"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261117-200224-bd8e4d4/sideshow-linux-amd64"
    sha256 "d41891fc883fe010eadbad46e17f573f0afe136391bd84fef5084633589b3c92"
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
