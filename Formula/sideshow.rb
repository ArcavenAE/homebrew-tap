class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.181040.571832f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181040-571832f/sideshow-darwin-arm64"
    sha256 "7a6dbb361d66bd6d480d2a2e23c1bd159f296104c9dcbc4ff3996bea514b860b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181040-571832f/sideshow-darwin-amd64"
    sha256 "0e3d765cbcd3ca7f25a5fae4be98f77f4547e3aea5e31b454886a77b6dbe3335"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-181040-571832f/sideshow-linux-amd64"
    sha256 "5b6d10ff1e1e5da34455163ccfd5892260cb2bf5ae0464894b70512ada287c26"
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
