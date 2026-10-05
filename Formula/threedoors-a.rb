class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261005.003613.c573441"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261005-003613-c573441/threedoors-a-darwin-arm64"
    sha256 "78eea555ed156925898d47bb1d5deae9cc341b20779048d93e2e49891a31129b"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261005-003613-c573441/threedoors-a-darwin-amd64"
    sha256 "2d87f3a6356324895c1825b6894e530c1aa496dc6b7148f8d66936efec711ff3"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261005-003613-c573441/threedoors-a-linux-amd64"
    sha256 "e39584d375a19dc15f5d2d6073c5204bca279997ae2dfdcf1601687e4176e83d"
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
