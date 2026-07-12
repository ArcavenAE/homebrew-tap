class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.223210.2566ba5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-223210-2566ba5/sideshow-darwin-arm64"
    sha256 "1a0b8e487a19d7aa4d207185e0f004c5cf648eff3984c2ae99d7ba1bf619037a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-223210-2566ba5/sideshow-darwin-amd64"
    sha256 "a0273598800b500856a4dcfe33dac098eb1c261c76a460ec90068a2a9493a727"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-223210-2566ba5/sideshow-linux-amd64"
    sha256 "f647292d835827eb6d9ebaa2f105deeb66bbfb8b57fb2ba613695dc0f2695d90"
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
