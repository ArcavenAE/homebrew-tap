class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.185225.5986763"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-185225-5986763/threedoors-a-darwin-arm64"
    sha256 "c851a0c55428988b8b69588d1faccc5229cea59bc14f23ae771e14316ee9188e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-185225-5986763/threedoors-a-darwin-amd64"
    sha256 "df431a11d0af8628af086840fa48864bc7a6650bff1c7345f7f914f64b6e15c8"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-185225-5986763/threedoors-a-linux-amd64"
    sha256 "9aac199eb1d12804e59c27f1743f7a3bdc70de1aaf6fc1ad951f17f3dd5d2918"
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
