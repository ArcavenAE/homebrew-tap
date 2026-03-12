class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.013944.1b88c90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-013944-1b88c90/threedoors-a-darwin-arm64"
    sha256 "9dad878e4445ec80666b115aa3829dcae941434a5cf54ccfe6a5cfaa7a90e6f6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-013944-1b88c90/threedoors-a-darwin-amd64"
    sha256 "f29acb247aebff7f00106afed05ce298b9f88bac20f071e1b36eef110867640d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-013944-1b88c90/threedoors-a-linux-amd64"
    sha256 "ed68854ac804ef0fea7942f2e444528d7a43b671bb06a50f8897733544a1a391"
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
