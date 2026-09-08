class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260908.223759.db54c9e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-223759-db54c9e/sideshow-darwin-arm64"
    sha256 "cd0660877773f45d64c3ab4df91af4411662d2b445c026e31997234b614100c8"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-223759-db54c9e/sideshow-darwin-amd64"
    sha256 "04d64013cca99aac901e21cdd888eb7f410c6817f7586e680743f919f6d06b45"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260908-223759-db54c9e/sideshow-linux-amd64"
    sha256 "a7b2365de4a7256a69962ba005747f5a744372540f8a34d175c86d3c219f99c8"
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
