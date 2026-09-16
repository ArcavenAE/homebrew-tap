class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260916.101856.3a5c6c6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-101856-3a5c6c6/threedoors-a-darwin-arm64"
    sha256 "e815430bc75124031e671e18fb2f2403031167c2247811f7fecb37cc4da89182"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-101856-3a5c6c6/threedoors-a-darwin-amd64"
    sha256 "90ad2a8b7c085125da605038b8a002a3b84106839f8197c7559f659eef715e5c"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-101856-3a5c6c6/threedoors-a-linux-amd64"
    sha256 "b6c76bccb1c6a56de52d24a0d6efffab46888632c000b6f22e329729bdc553f2"
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
