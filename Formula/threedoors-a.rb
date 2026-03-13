class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.145505.ec2a2fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-145505-ec2a2fd/threedoors-a-darwin-arm64"
    sha256 "811d6ead052bf56b9a3cbdbd1236d2aea8ace77548332b1d41ddb22804ef447c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-145505-ec2a2fd/threedoors-a-darwin-amd64"
    sha256 "4902b181d4d8e91fb67271d24b43ad0f86ba20bc4c330cba92902a5f46e0f04e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-145505-ec2a2fd/threedoors-a-linux-amd64"
    sha256 "09cff21a960a19568bd5b95c1676e807e359a6f557a6a7923c20ab9cbe38e656"
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
