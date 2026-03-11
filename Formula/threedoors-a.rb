class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.231821.944b569"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231821-944b569/threedoors-a-darwin-arm64"
    sha256 "d7839511d978a8a54161fc62fa6713ece799f10b8e36572dcb8d0a353bebbf7a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231821-944b569/threedoors-a-darwin-amd64"
    sha256 "24a897e5388bf60387802bc0399a4c3c33bf71b306ac827b03dbc359d4f9d3d1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-231821-944b569/threedoors-a-linux-amd64"
    sha256 "532cd30945689f013e319fcb64bc1a61fb5352a0fc31c50e311f81fced209d45"
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
