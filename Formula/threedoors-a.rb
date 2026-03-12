class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.040301.4e6435d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-040301-4e6435d/threedoors-a-darwin-arm64"
    sha256 "ac5214931600ce5e701cdd7de311648224e41c0c2cc32adc2362fc9342d21875"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-040301-4e6435d/threedoors-a-darwin-amd64"
    sha256 "e78c0813a87ebe68bd9b891d4959997f0cdc6fc36dd493662b5dc727f9ee7d8d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-040301-4e6435d/threedoors-a-linux-amd64"
    sha256 "d5911588c08a7f70664df5000563e39e3bffc50cfb020a5a07c95619ec4b3c28"
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
