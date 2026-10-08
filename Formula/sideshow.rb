class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.053235.001d7c8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053235-001d7c8/sideshow-darwin-arm64"
    sha256 "82d34ac7f6c3f0cede09160c6e651558e4741d097cb59166fe9c8268bb0a36fe"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053235-001d7c8/sideshow-darwin-amd64"
    sha256 "a4265e96ffcf711a67bacc08dcbb67a1e17e7ce9aa91d64a11ff3129daa2f679"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-053235-001d7c8/sideshow-linux-amd64"
    sha256 "9d1ed34429433a853d492145f58f17206117b638e3ecfa70359b3aea0b5c2ec7"
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
