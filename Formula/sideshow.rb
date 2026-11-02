class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261102.050323.e3c702e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-050323-e3c702e/sideshow-darwin-arm64"
    sha256 "2e70a52138cc970fe3ed94f609c5ea3592154462fbb0218789ba1af65c9ae9a3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-050323-e3c702e/sideshow-darwin-amd64"
    sha256 "01c03b7dd00fb237ae3f87d9d9770bd47104a62034028ee4cf89433a0a79f5ea"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261102-050323-e3c702e/sideshow-linux-amd64"
    sha256 "fb7eddefa658086a90cca97ad6dd7ff96863d9fa808e5380d46c6b710f0e4008"
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
