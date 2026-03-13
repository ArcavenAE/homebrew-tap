class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.043718.f494f57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-043718-f494f57/threedoors-a-darwin-arm64"
    sha256 "e901096271a95b84767ad80bbb64fe5094e009b06aba2393ba1c62c2be42e430"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-043718-f494f57/threedoors-a-darwin-amd64"
    sha256 "7eab1fdd568775f4214abfdd4cd488038f3c6944793e2b0ad0964da251bac971"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-043718-f494f57/threedoors-a-linux-amd64"
    sha256 "8c817cd12881e8f6632d0e40f12cecbc9b5f84274faa26c074578ab63d5558d2"
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
