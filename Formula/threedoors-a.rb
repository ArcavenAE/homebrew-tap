class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.202111.4a968cd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202111-4a968cd/threedoors-a-darwin-arm64"
    sha256 "6a004b3438bec501bf0d11e08fc4d36a228f228700052948433431acb4222425"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202111-4a968cd/threedoors-a-darwin-amd64"
    sha256 "76f0654e5e7d9320ee3816bbc53591dc7fff4a22b8ad930707bb2d921a527502"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202111-4a968cd/threedoors-a-linux-amd64"
    sha256 "2794569f15dea72d64122d1d2cea9fb3c46cee13d616ba5f09fe02764f680d1f"
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
