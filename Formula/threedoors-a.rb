class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.3f1b74c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3f1b74c/threedoors-a-darwin-arm64"
    sha256 "b35488c482c826f8c2c690e9138feabed2ef153ca2dc45bd24f1fba395f2432d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3f1b74c/threedoors-a-darwin-amd64"
    sha256 "e7b7a075871c3a4b0f7ef4eb1250b9bb64cb03835021249b4135a844964cb634"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3f1b74c/threedoors-a-linux-amd64"
    sha256 "a39c112909cfe41b06ab2d2f13a99e842ec0d41e38c3353b298af3d38f3d9cee"
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
