class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.053231.ce23d54"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053231-ce23d54/sideshow-darwin-arm64"
    sha256 "c40fb9850306e7441276ae5c9ff8abd758f2501dc05383d2d3643695f0b15c74"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053231-ce23d54/sideshow-darwin-amd64"
    sha256 "9cce84956739ea56409c88300f6b2024c2956f9b10a6811198b339c70aee5a04"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-053231-ce23d54/sideshow-linux-amd64"
    sha256 "31173b97a4a4b65dc33281025db99fa549e9e90a116faab753e0c323178be980"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
