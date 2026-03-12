class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.193107.eff0705"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193107-eff0705/threedoors-a-darwin-arm64"
    sha256 "b912c935f6ac6ea83238527ce0c250c8626ba9fb95d487c0e38c796236b52e1e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193107-eff0705/threedoors-a-darwin-amd64"
    sha256 "eca9d14c11662508a04cdcb1166c1cded0aa30a91f7f7cdc5d221adb71115377"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-193107-eff0705/threedoors-a-linux-amd64"
    sha256 "c8dbc5d8913930d54db8a325aed8620b37734edfb5792f2f829b6881633b64af"
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
