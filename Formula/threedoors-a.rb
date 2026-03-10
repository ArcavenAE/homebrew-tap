class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.7f0aad8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-7f0aad8/threedoors-a-darwin-arm64"
    sha256 "1fa1f5cada757fde686612f28d9a55465fd33c305fb618ce26846e4c46d802b7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-7f0aad8/threedoors-a-darwin-amd64"
    sha256 "4fca84ac5626648535b657c1976a5bc7debfed81db66000d5613799f5185641d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-7f0aad8/threedoors-a-linux-amd64"
    sha256 "d9c88cf66f58eadaeafd9eda6aa0013fbcc1deacc5c8939854915510427eee5e"
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
