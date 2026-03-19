class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.043128.3e8da33"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-043128-3e8da33/threedoors-a-darwin-arm64"
    sha256 "496f4026dfd59851c196871922cfe904673ca99b87b5efe051720062efbdbf9e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-043128-3e8da33/threedoors-a-linux-amd64"
    sha256 "8500ec63d24a4330e48fa22a666df8d5cf0c184266b3322729c08627935d2d7a"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
