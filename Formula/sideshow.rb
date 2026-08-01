class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.003925.483f297"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003925-483f297/sideshow-darwin-arm64"
    sha256 "e17d82052eee9ffabbdcf5743ca27a68c7cbcf17332df2688e35b409783f9f04"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003925-483f297/sideshow-darwin-amd64"
    sha256 "88490bdf12b805690bb07b7bb2c9c0eefe1fa1f18632fb144e4354321e55b7b0"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-003925-483f297/sideshow-linux-amd64"
    sha256 "d5d2edb9eb060eab67a3a95bc0691e4736533313d59dad768376b03a3e268ce0"
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
