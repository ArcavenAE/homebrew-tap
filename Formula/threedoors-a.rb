class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.061839.d1ed913"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-061839-d1ed913/threedoors-a-darwin-arm64"
    sha256 "5928099f7488e85920ab76907d68677ebf975d43b9b092d1e3f48ab5e622adad"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-061839-d1ed913/threedoors-a-darwin-amd64"
    sha256 "42022348d408fa73975215b17544ccdf3f8f70f1436fe6f28d4f0a306e3b4f79"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-061839-d1ed913/threedoors-a-linux-amd64"
    sha256 "927c58b583d70eb544d6c818b87b6adfc473ea82e7f6a86617a01645feda7bca"
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
