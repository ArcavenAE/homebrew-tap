class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.222816.4634474"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-222816-4634474/threedoors-a-darwin-arm64"
    sha256 "18ec1f8fdebf2b15c30ad8bccf548a2dcbe3f775458e155a1d658346353571e6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-222816-4634474/threedoors-a-darwin-amd64"
    sha256 "67e70b4c51c9b1a1121e071aa405c135f26b07dbe8ccc727a5b53d38bccc8dad"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-222816-4634474/threedoors-a-linux-amd64"
    sha256 "41f1d07a4a51d6e30b85ea5f035c9bbd9c5433d00c78c6d08920f7dbc6c4c767"
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
