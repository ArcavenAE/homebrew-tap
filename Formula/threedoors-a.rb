class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260318.061639.80349d6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-061639-80349d6/threedoors-a-darwin-arm64"
    sha256 "f58169716e2d806cbf184a7577a3f1dfbf00e3e8ea1e4e51acf3cd3ca01b3c1b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-061639-80349d6/threedoors-a-darwin-amd64"
    sha256 "36e9a3b69b9ecf74df6215b845bacbe6ba58e9a9c8113ba09fb572d2c0335403"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-061639-80349d6/threedoors-a-linux-amd64"
    sha256 "53abda8512769513a2aaab8d0ac83c39e80e05dff34e60c5bd68084bf5a09139"
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
