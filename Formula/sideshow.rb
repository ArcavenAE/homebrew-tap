class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.044012.c6d6cc9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-044012-c6d6cc9/sideshow-darwin-arm64"
    sha256 "f657f7784c146eba991121a545a38c2a136a9f848a12b42dbadde012a8a4bc06"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-044012-c6d6cc9/sideshow-darwin-amd64"
    sha256 "f1bb01e3cfae6b1daabd1ccfa2dcb01de5c479877488675b5748cd15a34215b9"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-044012-c6d6cc9/sideshow-linux-amd64"
    sha256 "b1f0f2b64fbb9bc25a87940ea5506f899c15a280f9905bdaa00a30426605cd48"
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
