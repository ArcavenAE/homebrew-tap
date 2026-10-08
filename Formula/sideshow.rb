class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.051747.ad8bd09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051747-ad8bd09/sideshow-darwin-arm64"
    sha256 "b67d25ec412dc52dfaecaffd1b9fa754959147b7ca3b818873c9faef3c4948af"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051747-ad8bd09/sideshow-darwin-amd64"
    sha256 "2233be34fc5b46aaeca64367a7b0726a9058d08653ed32cf5fcbd5a6ef004b6b"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-051747-ad8bd09/sideshow-linux-amd64"
    sha256 "9315f29e993c00bf9d17841b5be4fc6e0816a63bc5e3dad66126cad4f5c1e3b4"
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
