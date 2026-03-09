class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.9407ec9"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-9407ec9/threedoors-a-darwin-arm64"
    sha256 "4493a5558d75cd4c1b2ff29510a118d2a58c21c96e6b9fbd5851f74c857f4c5c"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-9407ec9/threedoors-a-darwin-amd64"
    sha256 "99d58241fd79daf3320934fdb1cc6e856f725494a3cbda1b6352282372d6adcd"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-9407ec9/threedoors-a-linux-amd64"
    sha256 "ef7759a7a92d26953669debfc204557153248b61b21d7cee45730f2644dd3865"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
